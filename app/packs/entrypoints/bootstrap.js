import "bootstrap";

let TabTrack = {
  current: 'localTab'
};

let handler = function(e) {
  TabTrack.current = e.target.id;
};

document.addEventListener("turbolinks:load", function() {
  localTab.onclick = handler;
  remoteTab.onclick = handler;

  document.getElementById(TabTrack.current).click();
});
