import "bootstrap";

$(function () {
  function tabShow(hash = window.location.hash) {
    var activeTab = $("a[href='" + hash + "']");
    activeTab && activeTab.tab('show');
    var tabs = document.querySelectorAll("a[role='tab']")

    tabs.forEach(function(elem){
      elem.addEventListener('click', function(event){
        let endUrl = event.target.attributes.href.value;
        window.history.pushState(null, null, endUrl);
      });
    });
  }
  // at the beginning of loading the page
  // parse ther url and open the right tab if needed
  const path = window.location.pathname;
  if (path.includes("/dashboard")) {
    var hash = window.location.hash;
    hash = hash.replace(/%23/g, '');

    tabShow(hash);
  } else {
    tabShow();
  }
});
