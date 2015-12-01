// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require_tree
//= require jquery.validate
//= require jquery_ujs
//= require csv_codes
//= require jquery.js
//= require jquery.validate.additional-methods
//= require turbolinks
//= require twitter/bootstrap
//= require highcharts
//= require highcharts/highcharts-more
//= require highcharts/themes/grid
//= require highcharts/modules/data
//= require.js


$(document).ready(function () {
$("#csvCodes").validate({
rules: {
"file": {required: true},
},
messages:
{
'file': {required: "*Please Choose a file to Upload"},
},
});
});


$(document).on('page:change',function() {
	if ( $( "#container-1" ).length ){
 	 var myData = $('#container-1').data("stuff");
  	 var myTitle = $('#container-1').data("code");
  	 var dateData = $('#yDiv').data("stuff");
    $('#container-1').highcharts({
	    colors: ["#514F78", "#42A07B", "#9B5E4A", "#72727F", "#1F949A", "#82914E", "#86777F", "#42A07B"],        
        chart: {
	    	className: 'skies',
			borderWidth: 1,
			plotShadow: true,    	
        	plotBackgroundImage: 'http://www.highcharts.com/demo/gfx/skies.jpg',
	        backgroundColor: {
	            linearGradient: [0, 0, 500, 500],
	            stops: [
	              	[0, 'rgba(255, 255, 255, 1)'],
				  	[1, 'rgba(255, 255, 255, 0)']
	            ]
	        },
        	plotBorderWidth: 1,
            zoomType: 'x'
        },        
        title: {
            	text: 'Total Calls response',
            	x: -20,
            	style: {
				color: '#3E576F',
				font: '16px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
			}
        },
        subtitle: {
	        style: {
				color: '#6D869F',
				font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
			},
            text: document.ontouchstart === undefined ?
                  	'Click and drag in the plot area to zoom' : 'Pinch the chart to zoom in'
        },
        xAxis: {
	        gridLineWidth: 0,
			lineColor: '#C0D0E0',
			tickColor: '#C0D0E0',
			labels: {
				style: {
					color: '#666',
					fontWeight: 'bold'
				}
			},
			title: {
				style: {
					color: '#666',
					font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif'
				}
			},
            categories: dateData
        },
		legend: {
			itemStyle: {
				font: '9pt Trebuchet MS, Verdana, sans-serif',
				color: '#3E576F'
			},
			itemHoverStyle: {
				color: 'black'
			},
			itemHiddenStyle: {
				color: 'silver'
			}
		},
		labels: {
			style: {
				color: '#3E576F'
			}
		},
        yAxis: {
	        alternateGridColor: 'rgba(255, 255, 255, .5)',
			lineColor: '#C0D0E0',
			tickColor: '#C0D0E0',
			tickWidth: 1,
			labels: {
				style: {
					color: '#666',
					fontWeight: 'bold'
				}
			},
            title: {
            	color: '#666',
				font: '12px Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif',
                text: 'Count'
            },
           legend: {
                enabled: false
            },
            plotOptions: {
                area: {
                    fillColor: {
                        linearGradient: {
                            x1: 0,
                            y1: 0,
                            x2: 0,
                            y2: 1
                        },
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                        ]
                    },
                    marker: {
                        radius: 2
                    },
                    lineWidth: 1,
                    states: {
                        hover: {
                            lineWidth: 1
                        }
                    },
                    threshold: null
                }
            }
    },
        	series: [{
        		type: 'area',
            	name: 'Miss call',
            	data: myData
 
        	}]
        });
      }
	});
//***********BARCHART Theme
$(document).ready(function () {
    var one = $("#BarDivone").data('stuff');
    var two = $("#BarDivtwo").data('stuff');
    var three = $("#BarDivthree").data('stuff');
    var more = $("#BarDivmore").data('stuff');
  	var dateData = $('#yDiv').data("stuff");
    // Load the fonts
    Highcharts.createElement('link', {
      href: '//fonts.googleapis.com/css?family=Signika:400,700',
      rel: 'stylesheet',
      type: 'text/css'
    }, null, document.getElementsByTagName('head')[0]);

    // Add the background image to the container
    Highcharts.wrap(Highcharts.Chart.prototype, 'getContainer', function (proceed) {
      proceed.call(this);
      this.container.style.background = 'url(http://www.highcharts.com/samples/graphics/sand.png)';
    });

    Highcharts.theme = {
      colors: ["#f45b5b", "#8085e9", "#8d4654", "#008000", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", 
                "#DF5353", "#7798BF", "#aaeeee"],
      chart: {
         backgroundColor: null,
         style: {
            fontFamily: "Signika, serif"
            },
         borderWidth: 0,
         Shadow: true,
         zoomType: 'x'         
        },
      title: {
         style: {
         	color: '#666',
            fontSize: '22px',
            fontWeight: 'bold'
         }
        },
      tooltip: {
         borderWidth: 0
        },
      legend: {
       borderWidth: 0,
         borderRadius: 5,
         borderWidth: 1,
         itemStyle: {
            fontWeight: 'bold',
            fontSize: '13px'
         }
        },
      xAxis: {
         labels: {
            style: {
               color: '#6e6e70',
               fontWeight: 'bold'
            }
         }
        },
      yAxis: {
         labels: {
            style: {
               color: '#6e6e70',
               fontWeight: 'bold'
            }
         }
        },
      plotOptions: {
         series: {
            shadow: true
         },
         candlestick: {
            lineColor: '#404048'
         },
         map: {
            shadow: false
         }
        },
    // General
      background2: '#E0E0E8'     
    };
    //**** code for bar chart
    // Apply the theme
    Highcharts.setOptions(Highcharts.theme);

       $('#barchart').highcharts({
           chart: {
               type: 'column',
               spacingBottom: 25,
               spacingTop: 20,
               spacingLeft: 20,
               spacingRight: 20
           },
           credits: {
               enabled: false
           },
           title: {
               text: 'Call count for repeated query from same Mb. No.',
               },
         
           xAxis: {
               categories:
                   dateData,
               crosshair: true,
               },
           yAxis: {
               min: 0,
               title: {
                   text: 'Count',
                   style: {
               fontSize: '12px',
                  }
                   
               }
           },
           tooltip: {
               headerFormat: '<span style="font-size:15px">{point.key}</span><table>',
               pointFormat: '<tr><td style="color:false;padding:0">{series.name}: </td>' +
                   '<td style="padding:0"><b>{point.y:1f}</b></td></tr>',
               shared: true,
               useHTML: true
           },
           plotOptions: {
               column: {
                   pointPadding: 0.002,
                   borderWidth: 0
               }
           },
           series: [{
               name: 'One',
               data: one
             },
              { 
               name: 'Two',
               data: two
              },
              {
               name: 'Three',
               data: three              	
              	},
              	{	
               name: 'More',
               data: more              		
           }]
       });
});


$(document).bind('page:change',function() 
{
   // executes when complete page is fully loaded, including all frames, objects and images
		$(document).on("click","#mobile_no th a", function() {
		$.getScript(this.href);
		return false;
		});

		$("#mobile_no_search input").keyup(function() {
		$.get($("#mobile_no_search").attr("action"), $("#mobile_no_search").serialize(), null, "script");
		return false;
		}); 
   
});