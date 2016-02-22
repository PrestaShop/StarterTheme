# PrestaShop Starter Theme

[Starter Theme](http://build.prestashop.com/news/starter-theme-kickoff/) is a tool for designer to work efficiently,
it includes only what is mandatory:
* a list of templates
* a configuration file
* the development assets with minimal javascripts and stylesheets

## Installation

Note the Starter Theme is only available for PrestaShop 1.7+.

Clone this repository and move the `StarterTheme` into `themes` folder.

```bash
# in PrestaShop folder
$~: cd themes
$~: git clone https://github.com/PrestaShop/StarterTheme.git

```

## How to use the starter theme to create a theme ? 

The Starter Theme contains the development files in the `_dev` folder.
First of all, install the dependencies using `npm`:

```bash
$~: cd _dev && npm install
```

Now the dependencies are installed and correctly set up, you can customise theses files.

> If you need to add image files, you can create `img` folder in `_dev` folder.

As stylesheets and javascript files are compiled and minified, you may wonder how to 
build new version of theses files after your modifications. You can use npm to check 
for any update and update the production version used by PrestaShop (localized in `assets` folder).

```bash
$~: npm run watch
```

## Theme architecture

Themes architecture since PrestaShop 1.7 has changed a lot.

```
.
├── assets
│   ├── css/
│   ├── img/
│   └── js/
├── config/
│   ├── theme.dist.yml
│   └── theme.yml
├── CONTRIBUTING.md
├── _dev/
│   ├── css/
│   ├── js/
│   ├── package.json
│   └── webpack.config.js
├── modules/
├── plugins/
├── preview.png
├── README.md
└── templates/
    ├── catalog/
    ├── checkout/
    ├── cms/
    ├── contact.tpl
    ├── customer/
    ├── errors/
    ├── index.tpl
    ├── layouts/
    ├── page.tpl
    ├── _partials/
    └── wrapper.tpl
```

* `assets` folder contains all "UI" data of your theme: javascripts, stylesheets and images;
* `config` contains the configuration file of your theme;
* `_dev` contains all the development assets;
* `modules` allow you to override templates for modules, take a look at `classic` theme;
* `plugins` contains the Smarty extensions required by the theme, if any;
* `templates` folder contains the templates of the theme, ordered by domain categories
* `preview.png` should be a thumbnail of your theme homepage, displayed in the back office

## Contributing

Take a look at our [Contributing guide](CONTRIBUTING.md)

## Update workflow

You may wonder how to access the latest features from this theme when you already have used and modified it.

You may apply a patch with the commits but most of the time, you will have to deal with conflicts because you 
will have updated `assets` and `templates`.

We will provide explicit changelogs with new features, fixes and impacted files to help you keep your [fork up to date](https://help.github.com/articles/syncing-a-fork/)
with the lastest improvements.
