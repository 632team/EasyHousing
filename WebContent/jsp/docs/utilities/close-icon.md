---
layout: docs
title: Close icon
group: utilities
---

Use a generic close icon for dismissing content like modals and alerts. **Be sure to include text for screen readers**, as we've done with `aria-label`.

{% example html %}
<button type="button" class="close" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
{% endexample %}
