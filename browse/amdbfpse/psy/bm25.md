---
title:
description:
---

{% assign datasets = site.data.datasets %}
{% assign page_path_parts = page.path | split: "/"%}

{% assign benchmark = page_path_parts[1] %}
{% assign dataset = page_path_parts[2] %}
{% assign run_name = page_path_parts[3] | split: "." %}
{% assign run_name = run_name[0] %}

{% assign runcards = site.data.runcards %}
{% assign ranxhub_id = runcards[benchmark][dataset][run_name]["ranxhub-id"] %}
{% assign paper_metadata = runcards[benchmark][dataset][run_name].paper %}
{% assign run_metadata = runcards[benchmark][dataset][run_name].run %}
{% assign model_metadata = runcards[benchmark][dataset][run_name].model %}


<div>
<h2 class="rc section-title">Run</h2>
<table class="rc table"> 
    <tr>
        <th>RanxHub ID:</th><td><code class="inline-code">{{ranxhub_id}}</code></td>
    </tr>
    <tr>
        <th>Version:</th><td>{{run_metadata.version}}</td>
    </tr>
    <tr>
        <th>Description:</th><td>{{run_metadata.description}}</td>
    </tr>
    <tr>
        <th>Tags:</th><td>{% for tag in run_metadata.tags %}{{ tag }}{% if forloop.last %}{% else %} · {% endif %}{% endfor %}</td>
    </tr>
    <tr>
        <th>Date:</th><td>{{run_metadata.date.day}} {{run_metadata.date.month}} {{run_metadata.date.year}}</td>
    </tr>
    <tr>
        <th>Run Authors:</th><td>{% for author in run_metadata.authors %}
            <a href="https://orcid.org/{{ author.orcid }}" target="_blank">{{ author.name }}</a>{% if forloop.last %}{% else %}&nbsp;·{% endif %}
        {% endfor %}</td>
    </tr>
    <!-- <tr>
        <th>Team:</th><td><a href="https://ikr3.disco.unimib.it" target="_blank">IKR3</a></td>
    </tr> -->
    <tr>
        <th>From Paper:</th><td>{% if paper_metadata.doi.size > 0 %}<a href="http://dx.doi.org/{{ paper_metadata.doi }}" target="_blank">{{ paper_metadata.title }}</a>{% else %}{{ paper_metadata.title }}{% endif %}</td>
    </tr>
    <tr>
        <th>Paper Authors:</th><td>
        {% for author in paper_metadata.authors %}
            {% if author.orcid.size > 0 %}
                <a href="https://orcid.org/{{ author.orcid }}" target="_blank">{{ author.name }}</a>
            {% else %}
                {{ author.name }}
            {% endif %}
            {% if forloop.last %}{% else %}·{% endif %}
        {% endfor %}
        </td>
    </tr>
</table>
</div>

<div>
<h2 class="rc section-title">Model</h2>
<table class="rc table"> 
    <tr>
        <th>Name:</th><td>{{model_metadata.name}}</td>
    </tr>
    <tr>
        <th>Description:</th><td>{{model_metadata.description}}</td>
    </tr>
    <tr>
        <th>Tags:</th><td>{% for tag in model_metadata.tags %}{{ tag }}{% if forloop.last %}{% else %} · {% endif %}
        {% endfor %}</td>
        
    </tr>
    <tr>
        <th>Paper:</th><td>{% if model_metadata.doi.size > 0 %}<a href="http://dx.doi.org/{{ model_metadata.doi }}" target="_blank">{{ model_metadata.paper }}</a>{% else %}{{ model_metadata.paper }}{% endif %}</td>
    </tr>
    <tr>
        <th>Authors:</th><td>
        {% for author in model_metadata.authors %}
            {% if author.orcid.size > 0 %}
                <a href="https://orcid.org/{{ author.orcid }}" target="_blank">{{ author.name }}</a>
            {% else %}
                {{ author.name }}
            {% endif %}
            {% if forloop.last %}{% else %}·{% endif %}
        {% endfor %}
        </td>
    </tr>
</table>
</div>

<div>
<h2 class="rc section-title">Results</h2>
<table class="rc metrics-table">
    <thead>
        <tr>
            <th class="metric">MAP@100</th>
            <th class="metric">MRR@10</th>
            <th class="metric">NDCG@10</th>
        </tr>        
    </thead>
    <tbody>
        <tr>
            <td class="metric-score">{{run_metadata.results["MAP@100"]}}</td>
            <td class="metric-score">{{run_metadata.results["MRR@10"] }}</td>
            <td class="metric-score">{{run_metadata.results["NDCG@10"]}}</td>
        </tr>
    </tbody>
</table>
</div>


<div>
<h2 class="rc section-title">Links</h2>
    <div class="flex-container">
        {% if run_metadata.code.size > 0 %}
            <div class="flex-child rc button"><a href="{{ run_metadata.code }}" target="_blank"><span class="social-icon">{% include social-icon.html icon="GitHub" %}</span>Code</a></div>
        {% else %}{% endif %}

        <!-- <div class="flex-child rc button"><a href="https://github.com/AmenRa/ranx" target="_blank"><span class="social-icon">{% include social-icon.html icon="pdf" %}</span>Run Paper</a></div>
        
        <div class="flex-child rc button"><a href="https://github.com/AmenRa/ranx" target="_blank"><span class="social-icon">{% include social-icon.html icon="pdf" %}</span>Run BibTex</a></div> -->

        {% if paper_metadata.doi.size > 0 %}
            <div class="flex-child rc button"><a href="http://dx.doi.org/{{ paper_metadata.doi }}" target="_blank"><span class="social-icon">{% include social-icon.html icon="pdf" %}</span>Run Paper</a></div>
        {% else %}{% endif %}

        {% if paper_metadata.dblp.size > 0 %}
            <div class="flex-child rc button"><a href="{{ paper_metadata.dblp }}" target="_blank"><span class="social-icon">{% include social-icon.html icon="pdf" %}</span>Run BibTex</a></div>
        {% else %}{% endif %}

        {% if model_metadata.doi.size > 0 %}
            <div class="flex-child rc button"><a href="http://dx.doi.org/{{ model_metadata.doi }}" target="_blank"><span class="social-icon">{% include social-icon.html icon="pdf" %}</span>Model Paper</a></div>
        {% else %}{% endif %}

        {% if model_metadata.dblp.size > 0 %}
            <div class="flex-child rc button"><a href="{{ model_metadata.dblp }}" target="_blank"><span class="social-icon">{% include social-icon.html icon="pdf" %}</span>Model BibTex</a></div>
        {% else %}{% endif %}

        {%- comment -%} <div class="flex-child rc button"><a href="https://github.com/AmenRa/ranx" target="_blank"><span class="social-icon">{% include social-icon.html icon="GitHub" %}</span>Run Code</a>
        </div> {%- endcomment -%}

        {%- comment -%} <div class="flex-child rc button"><a href="https://github.com/AmenRa/ranx" target="_blank"><span class="social-icon">{% include social-icon.html icon="pdf" %}</span>Model Paper</a>
        </div> {%- endcomment -%}

        {%- comment -%} <div class="flex-child rc button"><a href="https://github.com/AmenRa/ranx" target="_blank"><span class="social-icon">{% include social-icon.html icon="pdf" %}</span>Model BibTex</a>
        </div> {%- endcomment -%}
    </div>
</div>