<div align=center>
<h1>fonts</h1>
<p></p>
<img src="https://img.shields.io/github/license/skiletro/fonts?style=for-the-badge&labelColor=303446&color=f5c2e7"></img>
</div> 

## About
There are some fonts that aren't on nixpkgs. This is my nix flake which adds such fonts to your system. Currently, this flake installs the following fonts:
* Urbanist

Each font is available as it's own package in this flake, with `defaultPackage` a derivation giving all the listed fonts.

I am choosing not to include the font files in this repository; the flake is set up to download them from their sources, so that there are no licensing issues. This does mean, however, that the flake is subject to [link rot](https://en.wikipedia.org/wiki/Link_rot). If this does become an issue, I will update the library with the required files.
