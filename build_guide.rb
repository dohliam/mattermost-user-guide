#!/usr/bin/ruby
# encoding: utf-8

# Build script for customized Mattermost user guide

require 'kramdown'
require 'yaml'

script_dir = File.expand_path(File.dirname(__FILE__)) + "/"

if File.exist?(script_dir + "config.yml")
  config = YAML::load(File.read(script_dir + "config.yml"))
else
  abort("  No configuration file found.")
end

header_line = config[:header_line]
organization_name = config[:organization_name]
server_address = config[:server_address]
date_format = Time.now.strftime(config[:date_format])

file = File.read("mattermost-user-guide.md")

content = file
  .gsub(/Updated: @DATE/, '<p class="date">Updated: ' + date_format + '</p>')
  .gsub(/HEADER_LINE/, header_line)
  .gsub(/ORGANIZATION_NAME/, organization_name)
  .gsub(/SERVER_ADDRESS/, server_address)
  .gsub(/\!\[\]\(img\/index\.jpg\)/, '<p><img class="splash" src="img/index.jpg" alt="Cover image" /></p>')
  .gsub(/\A# (.*)/, "<h1 class=\"logo-heading\">\\1</h1>")
  .gsub(/\- \[ \](.*)/, "<br><input type=\"checkbox\">\\1\n")
  .gsub(/^\## Table of Contents/, "<div style='page-break-before:always;'></div>\n\n## Table of Contents")
  .gsub(/^\## \d+\. /, "<div style='page-break-before:always;'></div>\n\n\\0")

html = Kramdown::Document.new(content).to_html
$content = html.gsub(/^/, "    ").gsub(/<h4/, "<h4 class=\"channel\" ").gsub(/<li><img/, "<li class=\"illus\"><img").gsub(/<p>Guide prepared by <a/, "<footer>\n      <p>Guide prepared by <a").gsub(/(    <p><a rel="license".*)/, "  \\1\n    </footer>")

output = ERB.new(File.read("template.rhtml")).result

html_name = "mattermost-user-guide.html"
File.open(html_name, "w") { |o| o << output }

puts `wkhtmltopdf --footer-center "[page]" mattermost-user-guide.html mattermost-user-guide.pdf`
