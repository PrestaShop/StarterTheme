module.exports = function(grunt) {
  	grunt.loadNpmTasks('grunt-contrib-copy');

    grunt.registerTask('import', 'Import files from module', function() {
        var module = grunt.option('module');
        var path = grunt.option('theme') ? grunt.option('theme') : '..';

        if (typeof module === 'undefined') {
            grunt.log.error('Module name is required!');
            return false;
        }

        grunt.config('copy', {
            main: {
                files: [
                  {
                      expand: true,
                      cwd: '../../' + path + '/modules/',
                      src: [module + '/**/*.tpl'],
                      dest: '../modules'
                  },
                ],
            },
        });
        grunt.task.run('copy');
    });

    grunt.registerTask('default', ['import']);
};
