# PrestaShop Starter Theme

[![Build Status](https://travis-ci.org/PrestaShop/StarterTheme.svg?branch=master)](https://travis-ci.org/PrestaShop/StarterTheme)

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
$ cd themes
$ git clone https://github.com/PrestaShop/StarterTheme.git YOUR_THEME_NAME
```

## How to use the starter theme to create a theme

### Step 1: create `theme.yml`

First of all, you need to rename `config/theme.dist.yml` to `config/theme.yml` and edit it according to your theme name.

```
name: YOUR_THEME_DIRECTORY_NAME
display_name: YOUR THEME NAME
version: 1.0.0
author:
  name: "PrestaShop Team"
  email: "pub@prestashop.com"
  url: "http://www.prestashop.com"

meta:
  compatibility:
      from: 1.7.0.0
      to: ~
```

See [theme.yml description](https://github.com/PrestaShop/StarterTheme/blob/develop/doc/theme.yml.md)

**NOTE:** Please note that `/config/theme.yml` is ignored by git (see [.gitignore](https://github.com/PrestaShop/StarterTheme/blob/master/.gitignore))

### Step 2: Manage assets

The Starter Theme contains the development files in the `_dev` folder.
Install the dependencies using `npm`:

```bash
$ cd _dev && npm install
```

Now the dependencies are installed and correctly set up, you can customise theses files.

> If you need to add image files, you can create `img` folder in `_dev` folder.

As stylesheets and javascript files are compiled and minified, you may wonder how to
build new version of theses files after your modifications. You can use npm to check
for any update and update the production version used by PrestaShop (localized in `assets` folder).

```bash
$ npm run watch
```

Note: You should probably **start by removing all existing styles**.

## Theme architecture

Themes architecture has changed a lot since PrestaShop 1.7.

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

| Folder | Description |
|-------:|------------|
| `assets` | Contains all "UI" data of your theme: javascripts, stylesheets and images; |
| `config` | Contains the configuration file of your theme; |
| `_dev` | Contains all the development assets; |
| `modules` | Allow you to override templates for modules, take a look at `classic` | theme; |
| `plugins` | Contains the Smarty extensions required by the theme, if any; |
| `templates` | Contains the templates of the theme, ordered by domain categories |
| `preview.png` | Should be a thumbnail of your theme homepage, displayed in the back office |

## Update Workflow

### Understanding the branches

The StarterTheme's branches follow the PrestaShop's branches. That means that if you want to create a theme for PrestaShop `1.7.0.x` version, choose the latest release for this minor version (or use the `1.7.0.x` branches).

### Update

Every Prestashop release will be attached to a PrestaShop version and we will provide explicit changelogs with new features, fixes and impacted files to help you keep your theme up to date with the lastest improvements.

Since your theme will live its own life, you cannot just cherry-pick a commit. You will have to understand it and decide if that applies to your theme or not.

## Contributing

Take a look at our [Contributing guide](CONTRIBUTING.md)
