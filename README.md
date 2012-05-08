# Webify

A simple utility to serve static files to your browser. Handy to test Javascript apps. Supported backends include: WEBrick, Thin, and Mongrel.

Written by Rida Al Barazi and Peter Kieltyka from Nulayer Inc.

Enjoy.

## What's Different About This Fork?

The original project did not provide full support for Thin. Fortunately, a couple of lines of code is all that is need to fix that problem!

I've submitted a pull request to the maintainers. In the meantime, please feel free to use this version.

### Installation
1. Clone this repo.
2. Change directory in to your local clone of this repo.
3. Execute `gem install -l webify`

### Usage
1. Change directory in to a directory that you would like to serve.
2. Either execute `webify -t` to start up Webify using Thin, or `webify` to start up Webify using WEBrick.
3. Open http://localhost:3000 in your Web browser. The directory listing that you are now seeing in your browser is that same directory that you started Webify in.