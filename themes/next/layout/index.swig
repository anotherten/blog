{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{% block headband %}
 {% include '_partials/search.swig' %}
    <div class="headband1">
          <img class="index-img" itemprop="image"
                src="{{'/images/index.png' }}"/>
          <span class="arrow"></span>
    </div>
    <style>
      .headband{
        display:none;
      }
      #d1{
        overflow:hidden;
      }
      #d2{
          transition: all .5s;
      }
    </style>
      <script>
        window.currentPage = 1;
        var last = function () {
          var newPage = window.currentPage - 1;
          window.currentPage = newPage >= 1 ? newPage : 1;
        };
        var next = function () {
          var newPage = window.currentPage + 1;
          window.currentPage = newPage <= 2 ? newPage : 2;
        }
        var start = new Date();
        document.onmousewheel = function (e) {
          var now = new Date();
          if(now.getTime() - start.getTime() > 500){
            e = e || window.event;
            var sh = $(document).height();
            var target = $("#d2");
            var wheelDelta = e.wheelDelta;
            if (wheelDelta > 0) {
              console.log("鼠标向上滚动");
              if($('.container').scrollTop() === 0){
                last();
              }
            } else {
              console.log("鼠标向下滚动");
              next();
            }
            target.css("top", -(window.currentPage - 1) * sh);
            start = now;
          }
        }
  </script>
{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{% block content %}
  <div>
    <div class="menu-item menu-item-search">
              {% if theme.swiftype_key %}
                <a href="javascript:;" class="st-search-show-outputs">
              {% elseif theme.local_search.enable || theme.algolia_search.enable %}
                <a href="javascript:;" class="popup-trigger">
              {% endif %}
                {% if theme.menu_settings.icons %}
                  <i class="menu-item-icon fa fa-search fa-fw"></i> <br />{#
              #}{% endif %}{#
              #}{{ __('menu.search') }}{#
            #}</a>
    </div>
  </div>
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
      {{ post_template.render(post, true) }}
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
