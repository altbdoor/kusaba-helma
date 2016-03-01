---
layout: post
title: First of March
---

First off, a tip-off from fellows from /a/, [Brave Witches Teaser PV](https://www.youtube.com/watch?v=loEMf7G2y78) is out.

Probably not many who follow this project closely, but this `gh-pages` branch has been made for some time. The plan was to log the changes done to Helma. From my last email discussion, it appears that its time we have this running to remind ourselves on what we have planned.

The recent update has involved the sidebar. Originally Kusaba was using iframes for the sidebar, which is not good. Iframes have an [issue](http://stackoverflow.com/questions/2648053/preventing-iframe-caching-in-browser) (prevalently in Firefox) where the page is cached indefinitely. So if we make any changes on the sidebar, chances are, a user might not be able to see the changes.

After a discussion with HelmaAdmin, we have decided to rid the iframes, but keep the sidebar. Doing it on the main page (`kusaba.php`) is not an issue. It is a (more or less) standalone PHP page, where I can just `include 'menu.php';`. The tricky part is having the sidebar on the boards and threads page.

The better way is to somehow check into the dwoo templates and insert the sidebar. However, the templates are extremely unorganized to begin with. If I am to work with it, I'd rather do it from head to toe. And, knowing how slow I work in this project, probably season 4 would have finished airing by the time I am done.

So I created a JS shim of sorts for now, for it to be loaded in `global_board_header.tpl`. It will load the sidebar, and inject it at the right spot when the page is ready. We'll make do with this for now, until I finish with the whole sidebar thingamajig.

We're still ironing out the kinks in the recent update, so do perform a hard refresh every now and then (or when Helma appears messed up. Or if it still is, [report it](https://github.com/altbdoor/kusaba-helma/issues)!).

Regards.
