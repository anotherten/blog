<!DOCTYPE html>

{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.motion.enable %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}
  {% include '_partials/head/head-unique.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
  {% include '_scripts/noscript.swig' %}
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">

  {% set container_class = "container " %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}
<div id="d1">
  <div id="d2">
    <div class="headband">
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
    {% block headband %}{% endblock %}
    <div class="{{ container_class }} {% block page_class %}{% endblock %}">
      <div class="index-content">
          {% include '_third-party/github-banner.swig' %}
          <main id="main" class="main">
            <div class="main-inner">
              <div class="content-wrap">
                <div id="content" class="content">
                  {% block content %}{% endblock %}
                </div>
                {% include '_partials/comments.swig' %}
              </div>
              {% if theme.sidebar.display !== 'remove' %}
                {% block sidebar %}{% endblock %}
              {% endif %}
            </div>
          </main>

          <footer id="footer" class="footer">
            <div class="footer-inner">
              {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}
              {% include '_third-party/analytics/analytics-with-widget.swig' %}
              {% block footer %}{% endblock %}
            </div>
          </footer>

          {% if not theme.sidebar.b2t %}
            <div class="back-to-top">
              <i class="fa fa-arrow-up"></i>
              {% if theme.sidebar.scrollpercent %}
                <span id="scrollpercent"><span>0</span>%</span>
              {% endif %}
            </div>
          {% endif %}

          {% if theme.needmoreshare2.enable and theme.needmoreshare2.float.enable %}
            <div id="needsharebutton-float">
              <span class="btn">
                <i class="fa fa-share-alt" aria-hidden="true"></i>
              </span>
            </div>
          {% endif %}
      </div>
    </div>
  </div>
</div>
  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}

  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/boostrap.swig' %}

  {% include '_third-party/comments/index.swig' %}
  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/analytics/firestore.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/math/index.swig' %}
  {% include '_third-party/needsharebutton.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/pangu.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}
  {% include '_third-party/bookmark.swig' %}
</body>
</html>
