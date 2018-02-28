{% if page.prev or page.next %}
  <nav class="pagination" id="dddd">
    {{
      paginator({
        prev_text: '<i class="fa fa-angle-left"></i>',
        next_text: '<i class="fa fa-angle-right"></i>',
        mid_size: 1
      })
    }}
  </nav>
  <script>
      var pages = document.querySelectorAll('#dddd a') || [];
      for(var i = 0 , len = pages.length; i < len ; i++){
        var page = pages[i];
        if(page.href){
          page.href += '#main';
        }
      }
  </script>
{% endif %}
