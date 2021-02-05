---
layout: post
title: Emergency Announcement
---

<strike>This is an emergency announcement. We are currently having issues with Helma, and it is more or less in a lockdown now.</strike> Discussions can be found [here](http://desustorage.org/c/thread/2638250), <strike>but desustorage appears to be down for me as well. Not a good day to start with today</strike>.

**Update: 4 May 2016**

> Helma's up and running again!

The crisis is over. After the move to a new host, we struggled with the PHP configuration a little, as Kusaba was using some pretty old libraries. By the least we now know that we need PHP 5.3 if we ever jump ship again.

Some pictures from the Shirley thread were missing, and I don't think we were able to recover them. Other than that, all should be well with Helma.

Check out [helma.us](http://helma.us/) today to read the official reopening announcement from HelmaAdmin.

---

**Update: 28 Apr 2016**

> Apparently the domain transfer is going to take a while, so the site's going to stay down until at least May 3rd. Wish I could speed things up, but there's nothing I can do.

The server should be ready by then, so all that is left is the domain.

---

**Update: 27 Apr 2016 around 6.00 PM GMT+8**

> Good news for once. I managed to regain control of the domain name, and purchased a new hosting package from another company. Helma should be up and running again in a couple of days, unless I get sucker punched by something else.

We still have to import the data into the new servers, but at least things are going in our favor now. As mentioned, if all goes well, we will be up and running in a few days.

Here's hoping that Helma will have better days ahead for her.

---

**Update: 27 Apr 2016 around 10.00 AM GMT+8**

> Figures, all the hosts emails are dead. There's one last thing for me to try, their phone number. But I think I know how well that's going to go. Things aren't looking good.

<!-- -->

> I'm trying to save what I can, but we have a bigger problem now. I can't transfer my domain to a new host..

<!-- -->

> In order to make helma.us redirect to the new domain, I would have to be able to access it which I can't anymore.
> 
> I've sent out a email to the company that supposedly owns the domain (it wasn't my host, apparently.) so hopefully they'll unlock it for me.

<!-- -->

> Well some good news. Thanks to >>2649745 I have /sw/ up to page 8 lined up for downloading. There's going to a couple missing posts and threads (someone broke the Charlotte thread), but this is the best we can do.
> 
> If I don't get a reply about the domain tomorrow, I might just make a whole new site name, host it there, then wait until helmas domain expires then re-buy it. Far from ideal, but there are no other options at the moment.

<!-- -->

> I ripped all the html files, images, and thumbnails from the /sw/ threads up to page 8 which is mostly 2014 threads (we should already have those). All the files are in the proper folders (res, sec, thumb) and should work right.
> 
> The one thing I didn't get is the board page indexes. But I think I might be able to fix that manually.
> 
> And to expand, these files are all taken from the current "live" version of the site, not an archive.

<!-- -->

> I'm still going through the code, but I have a solid theory.
> 
> - The "regenerate all pages and threads" code kicked in (probably triggered by a post submitted in /sw/).
> - First portion of code is to "regenerate all board pages", which takes thread contents from the database.
> - Something went very wrong here. Either we hit the random limit, or something PHP messed up.
> - The board pages (/sw/1.html) and catalog (/sw/catalog.html) are regenerated, but with empty pages.
> - The script did not proceed to "regenerate all threads", and blurted out an error message (probably).
> - The thread pages are untouched (/sw/res/1.html), as it was not able to proceed. Board pages still remain the same with the blank pages.
> 
> Which would pretty much explain our odd structure in /sw/ now. So in short, we should have lost all our board pages and catalog.

<!-- -->

> &gt;Something went very wrong here. Either we hit the random limit, or something PHP messed up.
> 
> Cpanels automatic backup hit the space limit, so I think the regeneration failed because there isn't a single free byte on the server right now.

An Anon found a Google cache for /sw/, and if we're lucky, we should be able to retrieve all the missing files.

---

**Original: 26 Apr 2016**

> Don't know if any of you go to helma, but we just had a major problem (site hit an arbitrary, unlisted space limit) and I don't know if it can be fixed because the host is 99% dead and I don't even think I can contact them. I can't even access cpanel anymore. I have everything backed up and current -except- /sw/, which is a several month old backup (this happened while I was trying to backup /sw/)..
> 
> This could be fixed by tomorrow, or never, depending on if I ever get a reply.

<!-- -->

> To make matters worse, the last remaining parts of the hosts website aren't even loading now, hah.
> 
> &gt; Would you be able to switch hosts? I can only remember this one giving you nothing but problems. We can't let helma die. <br>
> Funnily enough the whole reason I was backing up the site in the first place was because I was planning on doing exactly that. I was hoping to start the transfer about a week from now.

<!-- -->

> Pretty much. Though with how broken my host is, there's also the possibility that I might not be able to transfer my domain. Which would be a nightmare. <br>
> Wost case is that everything will be completely restored on a new host, except /sw/ which will be several months, maybe even over half a year behind.

HelmaAdmin has contacted the site host support, but from past experience, they are hardly responsive. For the moment, we will have to wait for their response first. I will update this post accordingly.