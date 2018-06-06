$(function () {

  // at the beginning of loading the page
  // parse ther url and open the right tab if needed

  var activeTab = $("a[href='" + window.location.hash + "']");
  activeTab && activeTab.tab('show');
  var tabs = document.querySelectorAll("a[role='tab']")

  tabs.forEach(function(elem){
    elem.addEventListener('click', function(event){
      let endUrl = event.target.attributes.href.value;
      window.history.pushState(null, null, endUrl);
    });
  });
});
