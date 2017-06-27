---
layout: docs
title: Introduction
description: Get started with Bootstrap using the Bootstrap CDN and a template starter page.
group: getting-started
redirect_from: "/getting-started/"
---

Bootstrap is the world's most popular framework for building responsive, mobile-first sites and applications. Inside you'll find high quality HTML, CSS, and JavaScript to make starting any project easier than ever.

Here's how to quickly get started with the Bootstrap CDN and a template starter page.

## Contents

* Will be replaced with the ToC, excluding the "Contents" header
{:toc}

## Quick start

Looking to quickly add Bootstrap to your project? Use the Bootstrap CDN, provided for free by the folks at MaxCDN. Using a package manager or need to download the source files? [Head to the downloads page.]({{ site.baseurl }}/getting-started/download/)

Copy-paste the stylesheet `<link>` into your `<head>` before all other stylesheets to load our CSS.

{% highlight html %}
<link rel="stylesheet" href="{{ site.cdn.css }}" integrity="{{ site.cdn.css_hash }}" crossorigin="anonymous">
{% endhighlight %}

Add our JavaScript plugins, jQuery, and Tether near the end of your pages, right before the closing `</body>` tag. Be sure to place jQuery and Tether first, as our code depends on them. While we use [jQuery's slim build](https://blog.jquery.com/2016/06/09/jquery-3-0-final-released/) in our docs, the full version is also supported.

{% highlight html %}
<script src="{{ site.cdn.jquery }}" integrity="{{ site.cdn.jquery_hash }}" crossorigin="anonymous"></script>
<script src="{{ site.cdn.tether }}" integrity="{{ site.cdn.tether_hash }}" crossorigin="anonymous"></script>
<script src="{{ site.cdn.js }}" integrity="{{ site.cdn.js_hash }}" crossorigin="anonymous"></script>
{% endhighlight %}

And that's it—you're on your way to a fully Bootstrapped site. If you're at all unsure about the general page structure, keep reading for an example page template.

## Starter template

Be sure to have your pages set up with the latest design and development standards. That means using an HTML5 doctype and including a viewport meta tag for proper responsive behaviors. Put it all together and your pages should look like this:

{% highlight html %}
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{ site.cdn.css }}" integrity="{{ site.cdn.css_hash }}" crossorigin="anonymous">
  </head>
  <body>
    <h1>Hello, world!</h1>

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="{{ site.cdn.jquery }}" integrity="{{ site.cdn.jquery_hash }}" crossorigin="anonymous"></script>
    <script src="{{ site.cdn.tether }}" integrity="{{ site.cdn.tether_hash }}" crossorigin="anonymous"></script>
    <script src="{{ site.cdn.js }}" integrity="{{ site.cdn.js_hash }}" crossorigin="anonymous"></script>
  </body>
</html>
{% endhighlight %}

That's all you need for overall page requirements. Visit the [Layout docs]({{ site.baseurl }}/layout/overview/) or [our official examples]({{ site.baseurl }}/examples/) to start laying out your site's content and components.

## Important globals

Bootstrap employs a handful of important global styles and settings that you'll need to be aware of when using it, all of which are almost exclusively geared towards the *normalization* of cross browser styles. Let's dive in.

### HTML5 doctype

Bootstrap requires the use of the HTML5 doctype. Without it, you'll see some funky incomplete styling, but including it shouldn't cause any considerable hiccups.

{% highlight html %}
<!DOCTYPE html>
<html lang="en">
  ...
</html>
{% endhighlight %}

### Responsive meta tag

Bootstrap is developed *mobile first*, a strategy in which we optimize code for mobile devices first and then scale up components as necessary using CSS media queries. To ensure proper rendering and touch zooming for all devices, **add the responsive viewport meta tag** to your `<head>`.

{% highlight html %}
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
{% endhighlight %}

You can see an example of this in action in the [starter template](#starter-template).

### Box-sizing

For more straightforward sizing in CSS, we switch the global `box-sizing` value from `content-box` to `border-box`. This ensures `padding` does not affect the final computed width of an element, but it can cause problems with some third party software like Google Maps and Google Custom Search Engine.

On the rare occasion you need to override it, use something like the following:

{% highlight scss %}
.selector-for-some-widget {
  -webkit-box-sizing: content-box;
     -moz-box-sizing: content-box;
          box-sizing: content-box;
}
{% endhighlight %}

With the above snippet, nested elements—including generated content via `:before` and `:after`—will all inherit the specified `box-sizing` for that `.selector-for-some-widget`.

Learn more about [box model and sizing at CSS Tricks](https://css-tricks.com/box-sizing/).

### Normalize.css

For improved cross-browser rendering, we use [Normalize.css](https://necolas.github.io/normalize.css/) to correct small inconsistencies across browsers and devices. We further build on this with our own, slightly more opinionated styles with [Reboot]({{ site.baseurl }}/content/reboot/).

## Community

Stay up to date on the development of Bootstrap and reach out to the community with these helpful resources.

- Follow [@getbootstrap on Twitter](https://twitter.com/getbootstrap).
- Read and subscribe to [The Official Bootstrap Blog]({{ site.blog }}).
- Join [the official Slack room]({{ site.slack }}).
- Chat with fellow Bootstrappers in IRC. On the `irc.freenode.net` server, in the `##bootstrap` channel.
- Implementation help may be found at Stack Overflow (tagged [`bootstrap-4`](https://stackoverflow.com/questions/tagged/bootstrap-4)).
- Developers should use the keyword `bootstrap` on packages which modify or add to the functionality of Bootstrap when distributing through [npm](https://www.npmjs.com/browse/keyword/bootstrap) or similar delivery mechanisms for maximum discoverability.

You can also follow [@getbootstrap on Twitter](https://twitter.com/getbootstrap) for the latest gossip and awesome music videos.
