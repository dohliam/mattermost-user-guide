# Mattermost User Guide - A customizable onboarding guide for organizations using Mattermost

This unofficial onboarding guide is meant to be an easy to understand introduction and walkthrough for teams using Mattermost for the first time. The content has been developed based on experience as part of an ongoing institutional pilot of Mattermost as a team collaboration tool in postsecondary education. The version in this repository has been generalized for use by other organizations, and can be customized for a variety of use cases. It will be updated and expanded as the pilot continues.

_Note: Information and screenshots in this guide are based on Mattermost Enterprise Edition, specifically:_

* Server version: 4.4.0 (Build 4.4.2)
* App version: 1.61 (Build 86) for Android

## Features

* Links to Mattermost app in Play/App Store to avoid users downloading incorrect version
* Detailed instructions on how to log in when starting up the app
* Orientation and navigation of the basic user interface
* An extensive beginner checklist to help practise using all the main features of the platform

The guide is available in both PDF and responsive HTML formats. It can be configured to generate these with custom values for institution name, server address, etc (see sections below for details on generating customized versions of the guide).

## Demo

There is an [online sample version](https://dohliam.github.io/mattermost-user-guide/) of the guide, or you can [download it](https://dohliam.github.io/mattermost-user-guide/mattermost-user-guide.pdf) as a PDF. Both files are also available in the root directory of this repository.

## Configuration

All basic customization can be done by editing the `config.yml` file. The following configuration options are available for generating the user guide:

* `header_line`: Change this to customize the content of the header line at the top of the guide cover page
* `organization_name`: The name of your organization as you wish it to appear throughout the guide
* `server_address`: The full address of your Mattermost server, beginning with `https://`
* `date_format`: Your preferred date format
  * For ISO 8601 use: `%Y-%m-%d`
  * For other date formatting options, see [this list](https://hackhands.com/format-datetime-ruby/)

## Building customized guide

Requirements:

* ruby
  * kramdown gem
* wkhtmltopdf

Make sure to edit the [configuration file](#configuration) before building the guide.

Run `build_guide.rb` from the repository folder:

    ./build_guide.rb

If you have both `kramdown` and `wkhtmltopdf` installed, this should result in both an html and pdf version of the guide with your customizations.

## License

* User guide: [CC BY](http://creativecommons.org/licenses/by/4.0/)
* Code: MIT

Guide cover photo by [Tran Mau Tri Tam](https://unsplash.com/photos/pi_Ju6KoQIc) on [Unsplash](https://unsplash.com/)
