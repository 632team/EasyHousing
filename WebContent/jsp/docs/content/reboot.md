---
layout: docs
title: Reboot
description: Documentation and examples for Reboot, Bootstrap's collection of element-specific CSS that builds on Normalize.css.
group: content
redirect_from: "/content/"
---

Part of Bootstrap's job is to provide an elegant, consistent, and simple baseline to build upon. We use Reboot, a collection of element-specific CSS changes in a single file, to kickstart that.

Reboot builds upon Normalize, providing many HTML elements with somewhat opinionated styles using only element selectors. Additional styling is done only with classes. For example, we reboot some `<table>` styles for a simpler baseline and later provide `.table`, `.table-bordered`, and more.

## Contents

* Will be replaced with the ToC, excluding the "Contents" header
{:toc}

## Approach

Here are our guidelines and reasons for choosing what to override in Reboot:

- Update some browser default values to use `rem`s instead of `em`s for scalable component spacing.
- Avoid `margin-top`. Vertical margins can collapse, yielding unexpected results. More importantly though, a single direction of `margin` is a simpler mental model.
- For easier scaling across device sizes, block elements should use `rem`s for `margin`s.
- Keep declarations of `font`-related properties to a minimum, using `inherit` whenever possible.

## Page defaults

The `<html>` and `<body>` elements are updated to provide better page-wide defaults. More specifically:

- The `box-sizing` is globally set on every element—including `*:before` and `*:after`, to `border-box`. This ensures that the declared width of element is never exceeded due to padding or border.
- A base `font-size: 16px` is declared on the `<html>` and `font-size: 1rem` on the `<body>` for easy responsive type-scaling via media queries.
- The `<body>` also sets a global `font-family` and `line-height`. This is inherited later by some form elements to prevent font inconsistencies.
- For safety, the `<body>` has a declared `background-color`, defaulting to `#fff`.

## Native font stack

The default web fonts (Helvetica Neue, Helvetica, and Arial) have been dropped in Bootstrap 4 and replaced with a "native font stack" for optimum text rendering on every device and OS. Read more about [native font stacks in this *Smashing Magazine* article](https://www.smashingmagazine.com/2015/11/using-system-ui-fonts-practical-guide/).

{% highlight sass %}
$font-family-sans-serif:
  // Safari for OS X and iOS (San Francisco)
  -apple-system,
  // Chrome >= 56 for OS X (San Francisco), Windows, Linux and Android
  system-ui,
  // Chrome < 56 for OS X (San Francisco)
  BlinkMacSystemFont,
  // Windows
  "Segoe UI",
  // Android
  "Roboto",
  // Basic web fallback
  "Helvetica Neue", Arial, sans-serif !default;
{% endhighlight %}

This `font-family` is applied to the `<body>` and automatically inherited globally throughout Bootstrap. To switch the global `font-family`, update `$font-family-base` and recompile Bootstrap.

## Headings and paragraphs

All heading elements—e.g., `<h1>`—and `<p>` are reset to have their `margin-top` removed. Headings have `margin-bottom: .5rem` added and paragraphs `margin-bottom: 1rem` for easy spacing.

<div class="bd-example">
{% markdown %}
# h1 heading
Curabitur blandit tempus porttitor. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.

## h2 heading
Curabitur blandit tempus porttitor. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.

### h3 heading
Curabitur blandit tempus porttitor. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.

#### h4 heading
Curabitur blandit tempus porttitor. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.

##### h5 heading
Curabitur blandit tempus porttitor. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.

###### h6 heading
Curabitur blandit tempus porttitor. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.
{% endmarkdown %}
</div>

## Lists

All lists—`<ul>`, `<ol>`, and `<dl>`—have their `margin-top` removed and a `margin-bottom: 1rem`. Nested lists have no `margin-bottom`.

<div class="bd-example">
{% markdown %}
* Lorem ipsum dolor sit amet
* Consectetur adipiscing elit
* Integer molestie lorem at massa
* Facilisis in pretium nisl aliquet
* Nulla volutpat aliquam velit
  * Phasellus iaculis neque
  * Purus sodales ultricies
  * Vestibulum laoreet porttitor sem
  * Ac tristique libero volutpat at
* Faucibus porta lacus fringilla vel
* Aenean sit amet erat nunc
* Eget porttitor lorem

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa
4. Facilisis in pretium nisl aliquet
5. Nulla volutpat aliquam velit
6. Faucibus porta lacus fringilla vel
7. Aenean sit amet erat nunc
8. Eget porttitor lorem
{% endmarkdown %}
</div>

For simpler styling, clear hierarchy, and better spacing, description lists have updated `margin`s. `<dd>`s reset `margin-left` to `0` and add `margin-bottom: .5rem`. `<dt>`s are **bolded**.

<div class="bd-example">
{% markdown %}
<dl>
  <dt>Description lists</dt>
  <dd>A description list is perfect for defining terms.</dd>
  <dt>Euismod</dt>
  <dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem.</dd>
  <dd>Donec id elit non mi porta gravida at eget metus.</dd>
  <dt>Malesuada porta</dt>
  <dd>Etiam porta sem malesuada magna mollis euismod.</dd>
</dl>
{% endmarkdown %}
</div>

## Preformatted text

The `<pre>` element is reset to remove its `margin-top` and use `rem` units for its `margin-bottom`.

<div class="bd-example">
{% markdown %}
<pre>
.example-element {
  margin-bottom: 1rem;
}
</pre>
{% endmarkdown %}
</div>

## Tables

Tables are slightly adjusted to style `<caption>`s, collapse borders, and ensure consistent `text-align` throughout. Additional changes for borders, padding, and more come with [the `.table` class]({{ site.baseurl }}/content/tables/).

<div class="bd-example">
  <table>
    <caption>
      This is an example table, and this is its caption to describe the contents.
    </caption>
    <thead>
      <tr>
        <th>Table heading</th>
        <th>Table heading</th>
        <th>Table heading</th>
        <th>Table heading</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Table cell</td>
        <td>Table cell</td>
        <td>Table cell</td>
        <td>Table cell</td>
      </tr>
      <tr>
        <td>Table cell</td>
        <td>Table cell</td>
        <td>Table cell</td>
        <td>Table cell</td>
      </tr>
      <tr>
        <td>Table cell</td>
        <td>Table cell</td>
        <td>Table cell</td>
        <td>Table cell</td>
      </tr>
    </tbody>
  </table>
</div>

## Forms

Various form elements have been rebooted for simpler base styles. Here are some of the most notable changes:

- `<fieldset>`s have no borders, padding, or margin so they can be easily used as wrappers for individual inputs or groups of inputs.
- `<legend>`s, like fieldsets, have also been restyled to be displayed as a heading of sorts.
- `<label>`s are set to `display: inline-block` to allow `margin` to be applied.
- `<input>`s, `<select>`s, `<textarea>`s, and `<button>`s are mostly addressed by Normalize, but Reboot removes their `margin` and sets `line-height: inherit`, too.
- `<textarea>`s are modified to only be resizable vertically as horizontal resizing often "breaks" page layout.

These changes, and more, are demonstrated below.

<form class="bd-example">
  <fieldset>
    <legend>Example legend</legend>

    <p>
      <label for="input">Example input</label>
      <input type="text" id="input" placeholder="Example input">
    </p>

    <p>
      <label for="select">Example select</label>
      <select id="select">
        <option value="">Choose...</option>
        <optgroup label="Option group 1">
          <option value="">Option 1</option>
          <option value="">Option 2</option>
          <option value="">Option 3</option>
        </optgroup>
        <optgroup label="Option group 2">
          <option value="">Option 4</option>
          <option value="">Option 5</option>
          <option value="">Option 6</option>
        </optgroup>
      </select>
    </p>

    <p>
      <label>
        <input type="checkbox" value="">
        Check this checkbox
      </label>
    </p>

    <p>
      <label>
        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
        Option one is this and that
      </label>
      <label>
        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
        Option two is something else that's also super long to demonstrate the wrapping of these fancy form controls.
      </label>
      <label>
        <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled>
        Option three is disabled
      </label>
    </p>

    <p>
      <label for="textarea">Example textarea</label>
      <textarea id="textarea" rows="3"></textarea>
    </p>

    <p>
      <label for="time">Example temporal</label>
      <input type="datetime-local" id="time">
    </p>

    <p>
      <label for="output">Example output</label>
      <output name="result" id="output">100</output>
    </p>

    <p>
      <button type="submit">Button submit</button>
      <input type="submit" value="Input submit button">
      <input type="button" value="Input button">
    </p>

    <p>
      <button type="submit" disabled>Button submit</button>
      <input type="submit" value="Input submit button" disabled>
      <input type="button" value="Input button" disabled>
    </p>
  </fieldset>
</form>

## Misc elements

### Address

The `<address>` element is updated to reset the browser default `font-style` from `italic` to `normal`. `line-height` is also now inherited, and `margin-bottom: 1rem` has been added. `<address>`s are for presenting contact information for the nearest ancestor (or an entire body of work). Preserve formatting by ending lines with `<br>`.

<div class="bd-example">
  <address>
    <strong>Twitter, Inc.</strong><br>
    1355 Market St, Suite 900<br>
    San Francisco, CA 94103<br>
    <abbr title="Phone">P:</abbr> (123) 456-7890
  </address>

  <address>
    <strong>Full Name</strong><br>
    <a href="mailto:#">first.last@example.com</a>
  </address>
</div>

### Blockquote

The default `margin` on blockquotes is `1em 40px`, so we reset that to `0 0 1rem` for something more consistent with other elements.

<div class="bd-example">
  <blockquote class="blockquote">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
    <footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
  </blockquote>
</div>

### Inline elements

The `<abbr>` element receives basic styling to make it stand out amongst paragraph text.

<div class="bd-example">
  Nulla <abbr title="attribute">attr</abbr> vitae elit libero, a pharetra augue.
</div>

## HTML5 `[hidden]` attribute

HTML5 adds [a new global attribute named `[hidden]`](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/hidden), which is styled as `display: none` by default. Borrowing an idea from [PureCSS](http://purecss.io), we improve upon this default by making `[hidden] { display: none !important; }` to help prevent its `display` from getting accidentally overridden. While `[hidden]` isn't natively supported by IE10, the explicit declaration in our CSS gets around that problem.

{% highlight html %}
<input type="text" hidden>
{% endhighlight %}

{% callout warning %}
#### jQuery incompatibility

`[hidden]` is not compatible with jQuery's `$(...).hide()` and `$(...).show()` methods. This could potentially change in jQuery 3, but we're not holding our breath. Therefore, we don't currently especially endorse `[hidden]` over other techniques for managing the `display` of elements.
{% endcallout %}

To merely toggle the visibility of an element, meaning its `display` is not modified and the element can still affect the flow of the document, use [the `.invisible` class]({{ site.baseurl }}/utilities/invisible-content/) instead.

## Click delay optimization for touch

Traditionally, browsers on touchscreen devices have a delay of approximately 300ms between the end of a "tap" – the moment when a finger/stylus is lifted from screen – and the [`click` event](https://developer.mozilla.org/en-US/docs/Web/Events/click) being fired. This delay is necessary for these browsers to correctly handle "double-tap to zoom" gestures without prematurely triggering actions or links after the first "tap", but it can make your site feel slightly sluggish and unresponsive.

Most mobile browsers automatically optimize away this 300ms delay for sites that use the `width=device-width` property as part of their [responsive meta tag]({{ site.baseurl }}/getting-started/introduction/#responsive-meta-tag) (as well as for sites that disable zooming, for instance with `user-scalable=no`, though this practice is strongly discouraged for accessibility and usability reasons). The biggest exceptions here are IE11 on Windows Phone 8.1, and iOS Safari (and any other iOS WebView-based browser) [prior to iOS 9.3](https://webkit.org/blog/5610/more-responsive-tapping-on-ios/).

On touch-enabled laptop/desktop devices, IE11 and Microsoft Edge are currently the only browsers with "double-tap to zoom" functionality. As the [responsive meta tag]({{ site.baseurl }}/getting-started/introduction/#responsive-meta-tag) is ignored by all desktop browsers, using `width=device-width` will have no effect on the 300ms delay here.

To address this problem in IE11 and Microsoft Edge on desktop, as well as IE11 on Windows Phone 8.1, Bootstrap explicitly uses the [`touch-action:manipulation` CSS property](https://developer.mozilla.org/en-US/docs/Web/CSS/touch-action) on all interactive elements (such as buttons and links). This property essentially disables double-tap functionality on those elements, eliminating the 300ms delay.

In the case of old iOS versions (prior to 9.3), the suggested approach is to use additional scripts such as [FastClick](https://github.com/ftlabs/fastclick) to explicitly work around the delay.

For further details, see the compatibility table for [suppressing 300ms delay for touchscreen interactions](https://patrickhlauke.github.io/touch/tests/results/#suppressing-300ms-delay).
