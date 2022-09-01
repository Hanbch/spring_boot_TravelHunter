Morris.Area({
  element: "morris-area-chart2",
  data: [
    {
      period: "1월",
      SiteB: 500,
    },
    {
      period: "2월",
      SiteB: 130,
    },
    {
      period: "3월",
      SiteB: 80,
    },
    {
      period: "4월",
      SiteB: 500,
    },
    {
      period: "5월",
      SiteB: 180,
    },
    {
      period: "6월",
      SiteB: 105,
    },
    {
      period: "7월",
      SiteB: 250,
    },
    {
      period: "8월",
      SiteB: 250,
    },
    {
      period: "9월",
      SiteB: 250,
    },
    {
      period: "10월",
      SiteB: 100,
    },
    {
      period: "11월",
      SiteB: 300,
    },
    {
      period: "12월",
      SiteB: 800,
    },
  ],
  xkey: "period",
  ykeys: ["SiteB", "SiteB"],
  labels: ["Site A", "Site B"],
  pointSize: 0,
  fillOpacity: 0.7,
  pointStrokeColors: ["#ccc", "#cbb2ae"],
  behaveLikeLine: true,
  gridLineColor: "#e0e0e0",
  lineWidth: 0,
  smooth: false,
  hideHover: "auto",
  lineColors: ["#ccc", "#cbb2ae"],
  resize: true,
});

$(".counter").counterUp({
  delay: 100,
  time: 1200,
});
