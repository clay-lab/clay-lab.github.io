---
layout: page
title: Resources
permalink: /resources/
---

<!--
  <header class="post-header">
    <h3 class="post-title">Links</h3>
  </header> 
  -->



{% for link in site.data.links %}
<div class ="row">

<div style="text-align:center">
<h2>{{link.group}}</h2>
</div>
</div>

<p> The following are resources that have been developed by the
members of the CLAY lab.
</p>


<table class="table table-striped table-hover">
<tr>
    <th> Name </th> <th> Description </th> 
</tr>
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



