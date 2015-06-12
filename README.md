Mahara Readme
-------------

Thanks for downloading Mahara!

SUPPORT: The best ways of obtaining support are:

 * http://manual.mahara.org/ - the Mahara online manual
 * http://www.mahara.org/forums - the Mahara project forums
 * #mahara on freenode (IRC) - live chat with other users and developers

INSTALLATION:

To install, please follow the instructions here:

  https://wiki.mahara.org/System_Administrator%27s_Guide/Installing_Mahara

UPGRADING:

Mahara 15.10 supports direct upgrades from previous Mahara versions 1.1.0 and later.
To upgrade an existing Mahara installation, follow the instructions here:

  https://wiki.mahara.org/System_Administrator%27s_Guide/Upgrading_Mahara

SYSTEM REQUIREMENTS:

The system requirements for the most recent version of Mahara are here:

  https://wiki.mahara.org/index.php/System_Administrator%27s_Guide/Requirements

Mahara 15.10 requires:

 * Database:
 ** Postgres 8.3 or later
 ** or MySQL 5.1 or later

 * Web Server: Mahara is only officially supported on Apache 2 or later,
   although it will probably run in any web server with the proper PHP
   extensions.

 * PHP 5.3 or later, with the following extensions:
 ** curl
 ** gd (including Freetype support)
 ** json
 ** ldap
 ** libxml
 ** mbstring
 ** mcrypt
 ** mime_magic; or fileinfo
 ** pgsql; or mysqli; or mysql
 ** session
 ** SimpleXML
 ** bz2 (optional)
 ** imagick (optional)
 ** openssl and xmlrpc (optional; for networking support)
 ** zlib (optional)
 ** adodb (optional; improves performance)
 ** enchant or pspell (optional; for TinyMCE spellcheck button)
 ** ... and ensure that the magic_quotes and register_globals settings are off.

 * OS: Mahara is only officially supported on Debian (5.0/"Lenny" or later) and
   Ubuntu (10.04/"Lucid Lynx" or later), however it will probably run in any
   OS with a suitable web server

 * Web Browser: Mahara should be accessible in any modern web browser with
   Javascript support. However, it is only actively tested in the most recent
   versions of Firefox, Chrome, Safari, and Opera; and the last three versions
   of IE. For Mahara 1.9.0, these versions are:
 ** Firefox - 24.0
 ** Chrome - 34.0
 ** Safari - 6.0
 ** Opera - 17.0
 ** IE - 9, 10, 11

TRANSLATIONS: You can get language packs from:

  https://wiki.mahara.org/Download_Mahara

MOODLE: Documentation on integrating Mahara with Moodle can be found in the
3.1MB PDF here:

  https://wiki.mahara.org/images/d/d5/Mahoodle.pdf

  -- the Mahara Development Team


Copyright notice
----------------

Copyright (C) 2006-2014 Catalyst IT and others; see:
https://wiki.mahara.org/index.php/Contributors

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, version 3 or later of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Additional permission under GNU GPL version 3 section 7:

If you modify this program, or any covered work, by linking or
combining it with the OpenSSL project's OpenSSL library (or a
modified version of that library), containing parts covered by the
terms of the OpenSSL or SSLeay licenses, the Mahara copyright holders
grant you additional permission to convey the resulting work.
Corresponding Source for a non-source form of such a combination
shall include the source code for the parts of OpenSSL used as well
as that of the covered work.
