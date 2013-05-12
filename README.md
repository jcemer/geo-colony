Geo Colony
==========

An application to geo referencing developed through the undergraduate thesis Migrating Web Applications to Open Platforms.

Preview at http://geo-colony.ap01.aws.af.cm/public.

Deploy
----------

Get the files.

```
git clone --recursive git://github.com/jcemer/geo-colony
```

Rename file `/fuel/app/config/db.example.php` to `/fuel/app/config/db.php` and set up MySQL database credentials.

Put the `public` folder in your public interface (a.k.a `public_html` or `public`). The others folders can stand hidden from external access.

Development
----------
Run `npm install` to install node modules used to compile the assets.

Use `cake build` to compile the `assets` folder content to `public/assets`. You can also run `cake watch` and `cake dev watch` to live recompile the files.

Credits
----------

The these was oriented by [Carlos A. Heuser](http://www.inf.ufrgs.br/~heuser) and authored by [Jean Carlo Emer](http://jcemer.com).




