---
layout: page
title: Publications
permalink: /publications/
---

  <header class="post-header">
    <h2 class="post-title">Publications</h2>
  </header> 

{% for link in site.data.publications %}

<table class="table table-striped table-hover">
{% for link in link.links %}
    <tr>
        <td> 
           <a href="{{link.url}}">{{link.name}}</a> 
        </td>
        <td> {{ link.description }}  </td>
    </tr>
{% endfor %}
</table>
{% endfor %}

<style>
#pubTable_filter{
    display:none;
}
</style>

<table id="pubTable" class="table table-hover"></table>



