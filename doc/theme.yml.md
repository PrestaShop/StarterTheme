# Theme configuration file

In order to be activated, this theme needs to be configured with a `theme.yml` file in `config/` folder.
Several files will be checked by the **Theme Manager** to validate the theme's integrity.
 
## Mandatory Structure Requirements

A theme must consist of the following file structure before it can be isntalled:

| Localization        | Description           |
|:--------------------|-----------------------| 
| -                   | preview.png           |
| config              | theme.yml             |
| assets/js           | theme.js              |
| assets/css          | theme.css             |
| templates           | page.tpl              |
| templates/catalog   | product.tpl           |
| templates/catalog   | product-miniature.tpl |
| templates/checkout  | cart.tpl              |
| templates/checkout  | checkout.tpl          |
| templates/_partials | head.tpl              |
| templates/_partials | header.tpl            |
| templates/_partials | notifications.tpl     |
| templates/_partials | footer.tpl            |

## Mandatory Configuration File Contents

This is a list of properties required in the configuration file.

| Property                                     | Description                               |
|:---------------------------------------------|-------------------------------------------| 
| name                                         | Theme name (folder name)                  |
| display_name                                 | Theme name displayed in Back Office       |
| version                                      | Theme version                             |
| author.name                                  | Author name                               |
| meta.compatibility.from                      | Theme minimal version of PrestaShop       |
| meta.available_layouts                       | Theme available layouts                   |
| global_settings.image_types.cart_default     | Define all available thumbnails           |
| global_settings.image_types.small_default    | For cart and product                      |
| global_settings.image_types.medium_default   | home, category                            |
| global_settings.image_types.large_default    | -                                         |
| global_settings.image_types.home_default     | -                                         |
| global_settings.image_types.category_default | -                                         |

Regarding this list, a minimal theme configuration file could be this one:

```yaml
name: Minimal Theme
display_name: Minimal
version: 0.1.0
author:
  name: "PrestaShop Team"

meta:
  compatibility:
      from: 1.7.0.0

  available_layouts:
    layout-full-width:
      name: Full width layout
      description: Ideal for product pages to maximize picture size
    layout-left-side-column:
      name: One small left column
      description: Great for CMS pages to show advertisements on the side

global_settings:
  image_types:
    cart_default:
      width: 80
      height: 80
      scope: [products]
    small_default:
      width: 125
      height: 125
      scope: [products, categories, manufacturers, suppliers]
    medium_default:
      width: 300
      height: 300
      scope: [products, categories, manufacturers, suppliers]
    large_default:
      width: 500
      height: 500
      scope: [products]
    home_default:
      width: 250
      height: 250
      scope: [products]
    category_default:
      width: 960
      height: 350
      scope: [categories]
```

## Exhaustive configuration file

```yaml
name: StarterTheme # The name must match the directory name
display_name: Starter Theme
version: 1.0.0
author:
  name: "John Doe"
  email: "pub@prestashop.com"
  url: "http://www.prestashop.com"

meta:
  compatibility:
      from: 1.7.0.0
      to: ~
  available_layouts:
    # Users will be able to choose each page's layout
    # from the theme's settings page.
    # Layouts are automatically parsed from the templates/layouts
    # folder so this configuration key is optional,
    # but it allows designers to provide some more user friendly
    # info than just a filename.
    layout-full-width:
      name: Full width layout
      description: Ideal for product pages to maximize picture size
    layout-left-side-column:
      name: One small left column
      description: Great for CMS pages to show advertisements on the side

global_settings:
  # All the settings below are used as default settings
  # when the theme is enabled on a shop.
  configuration:
    # All configuration values below are set
    # when the theme is enabled.
    PS_QUICK_VIEW: false
    NEW_PRODUCTS_NBR: 4
    PS_PNG_QUALITY: 8
  modules:
    to_enable:
      # All modules below are enabled when
      # the theme is enabled (and installed if needed).
      # They are disabled when the theme is disabled.
      - my-custom-module
      - yippeeslider
    to_disable:
      # All modules below are disabled when the theme is enabled.
      # They are re-enabled when the theme is disabled.
      - homeslider
      - blockwishlist
  hooks:
    custom_hooks:
      - name: displayFooterBefore
        title: displayFooterBefore
        description: Add a widget area above the footer
    modules_to_hook:
      displayHeaderTop:
        # displayHeaderTop will have exactly the following
        # modules hooked to it, in the specified order.
        # Each module in this list will be unhooked
        # from all other display hooks it is hooked to.
        - blocklanguages
        - blockcurrencies
        - blockuserinfo
      displayHeaderMiddle:
        # displayHeaderMiddle will have whatever is currently hooked to it
        # kept hooked to it, and blocksearch will be appended
        # to the list (or moved to the end if already hooked there).
        - ~
        - blocksearch
      displayHeaderBottom:
        # displayHeaderBottom will have blocktopmenu and blockcart
        # prepended to it.
        - blocktopmenu
        - blockcart
        - ~
      displayFooter:
        - blocknewsletter
      displayLeftColumn:
        # blockcategories is hooked on all pages on displayLeftColumn
        - blockcategories
        # blocktags is hooked on displayLeftColumn on all pages
        # except "category" and "index"
        - blocktags:
            except_pages:
              - category
              - index

  image_types:
    # When theme will be enabled, all image types will be removed
    # Template must declare their image type.
    cart_default:
      width: 80
      height: 80
      scope: [products]
    small_default:
      width: 125
      height: 125
      scope: [products, categories, manufacturers, suppliers]
    medium_default:
      width: 300
      height: 300
      scope: [products, categories, manufacturers, suppliers]
    large_default:
      width: 500
      height: 500
      scope: [products]
    home_default:
      width: 250
      height: 250
      scope: [products]
    category_default:
      width: 960
      height: 350
      scope: [categories]
    product_listing:
      width: 220
      height: 220
      scope: [products, categories, manufacturers, suppliers]
    large_banner:
      width: 960
      height: 400
      scope: [categories]


theme_settings:
  # All the settings below can be changed through
  # an interface in the theme's administration panel,
  # and only depend on the theme / shop combination.
  #
  # When this file is parsed by PrestaShop, this configuration
  # key (theme_settings) is copied to a file name settings_n.yml
  # where n is the id of the shop where the theme is installed.
  #
  # When configuration is changed through the interface, only the
  # settings_n.yml file is updated and theme.yml remains unchanged.

  # The layout to use for all pages
  default_layout: layout-full-width
  layouts:
    # Specific layout for some pages
    identity: layout-left-side-column
    order-confirmation: layout-left-side-column
```
