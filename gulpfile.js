var browserify  = require('browserify');
var babelify    = require('babelify');
var gulp        = require('gulp');
var stylus      = require('gulp-stylus');
var sourcemaps  = require('gulp-sourcemaps');
var source      = require('vinyl-source-stream');
var buffer      = require('vinyl-buffer');
var watchify    = require('watchify');
var exit        = require('gulp-exit');

function compileCSS (watch) {
  var options = {
    'include css': true
  };

  if (watch) {
    options.onupdate = function recompile (changedFile) {
      console.log('> File `%s` changed, recompiling CSS!', changedFile);
      compileCSS(false);
    };
  }

  gulp.src('./src/css/theme.styl')
    .pipe(sourcemaps.init())
    .pipe(stylus(options))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('./assets/css/'))
    .on('end', function () {
      console.log('= Done recompiling CSS!');
    })
  ;
}

function compileJS (watch) {
  var bundler = watchify(browserify('./src/js/theme.js', {debug: true}).transform(babelify));

  function doBundle() {
    var chain = bundler.bundle()
        .on('error', function(err) { console.error(err); this.emit('end'); })
        .pipe(source('theme.js'))
        .pipe(buffer())
        .pipe(sourcemaps.init({ loadMaps: true }))
        .pipe(sourcemaps.write('./'))
        .pipe(gulp.dest('./assets/js'))
        .on('end', function () {
          console.log('= Done recompiling JS!');
        })
    ;

    if (!watch) {
      chain.pipe(exit());
    }
  }

  if (watch) {
    bundler.on('update', function(changedFile) {
      console.log('> File `%s` changed, recompiling JS!', changedFile);
      doBundle();
    });
  }

  doBundle();
}

gulp.task('compile-css', function () {
  compileCSS(false);
});

gulp.task('compile-js', function () {
  compileJS(false);
});

gulp.task('watch-css', function () {
  compileCSS(true);
});

gulp.task('watch-js', function () {
  compileJS(true);
});

gulp.task('build', [
  'compile-css',
  'compile-js'
]);

gulp.task('watch', [
  'watch-css',
  'watch-js'
]);

gulp.task('default', ['build']);
