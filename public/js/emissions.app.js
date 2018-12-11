var cumminsApp = new Vue({
  el: '#iotDiv',
  data: {
    serviceLog: [],
    emmissions: [],
    sensorTimeSeries: [
				{
	        sensorDeployedId: '',
	        dataCollectedDate: '',
	        output: '',
	        heartRate: '',
	        compressorEfficiency: '',
	        availability: '',
	        reliability: '',
	        firedHours: '',
	        trips: '',
	        starts: ''
    		}
			],
  },
  computed: {
  },
  methods: {
    fetchServiceLogData () {
      fetch('http://ec2-35-166-59-91.us-west-2.compute.amazonaws.com/api/serviceLog.php')
      .then( response => response.json() )
      .then( json => {cumminsApp.serviceLog = json; console.log(json)} )
      .catch( err => {
        console.log('Data fetch error');
        console.log(err);
      })
    },
    fetchEmmissionsData () {
      fetch('http://ec2-35-166-59-91.us-west-2.compute.amazonaws.com/api/emmissions.php')
      .then( response => response.json() )
      .then( json => {cumminsApp.emmissions = json; console.log(json)} )
      .catch( err => {
        console.log('Data fetch error');
        console.log(err);
      })
    },
    formatSensorTime(){
				this.sensorTimeSeries.forEach(
				(entry, index, arr) => {
					entry.dataCollectedDate = entry.dataCollectedDate;
					entry.output = Number(entry.output);
					entry.heatRate = Number(entry.heartRate);
					entry.compressorEfficiency = Number(entry.compressorEfficiency);
					entry.availability = Number(entry.availability);
					entry.reliability = Number(entry.reliability);
					entry.fixedHours = Number(entry.firedHours);
					entry.trips = Number(entry.trips);
					entry.starts = Number(entry.starts);
				})
			},
    fetchSensorTimeSeries() {
				// console.log(document.getElementById("feedbackComment").value);
	      fetch('http://ec2-13-233-94-247.ap-south-1.compute.amazonaws.com/api/sensorTimeSeries.php')
	      .then(response => response.json())
	      .then (json => {
					this.sensorTimeSeries = json;
					this.formatSensorTime();
					this.buildSensorAvailability();
          this.buildSensorReliability();
          this.buildCapacity();
          this.buildDowntime();
				})
	      .catch( function(err){
	        console.log(err)
	      })
	    },
    buildSensorAvailability(){
        Highcharts.chart('sensorAvailabilityChart', {
            chart: {
                zoomType: 'x'
            },
            title: {
                text: 'Product 1'
            },
            yAxis: {
                title: {
                    text: 'Emmissions'
                }
            },
            xAxis: {
                title: {
                    text: 'Time'
                }
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
                            [0, Highcharts.getOptions().colors[1]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[2]).setOpacity(0).get('rgba')]
                        ]
                    },
                    marker: {
                        radius: 2
                    },
                    lineWidth: 0,
                    states: {
                        hover: {
                            lineWidth: 0.2
                        }
                    },
                    threshold: null
                }
            },

            series: [{
                type: 'area',
                name: '',
								// data: [[1,55],[2,56],[3,67],[4,89]]
                data: this.sensorTimeSeries.map( entry => [entry.dataCollectedDate.toString(), entry.availability])
            }]
        });
            Highcharts.chart('sensorReliability', {
                chart: {
                    zoomType: 'x'
                },
                title: {
                    text: 'Product 2'
                },
                yAxis: {
                    title: {
                        text: 'Emmissions'
                    }
                },
                xAxis: {
                    title: {
                        text: 'Time'
                    }
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
                                [0, Highcharts.getOptions().colors[2]],
                                [1, Highcharts.Color(Highcharts.getOptions().colors[3]).setOpacity(0).get('rgba')]
                            ]
                        },
                        marker: {
                            radius: 2
                        },
                        lineWidth: 0,
                        states: {
                            hover: {
                                lineWidth: 0.2
                            }
                        },
                        threshold: null
                    }
                },

                series: [{
                    type: 'area',
                    name: '',
    								// data: [[1,55],[2,56],[3,67],[4,89]]
                    data: this.sensorTimeSeries.map( entry => [entry.dataCollectedDate.toString(), entry.availability])
                }]
            });
			},
      buildSensorReliability(){
          Highcharts.chart('capacity', {
              chart: {
                  zoomType: 'x'
              },
              title: {
                  text: 'Product 3'
              },
              yAxis: {
                  title: {
                      text: 'Emmissions'
                  }
              },
              xAxis: {
                  title: {
                      text: 'Time'
                  }
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
                              [0, Highcharts.getOptions().colors[1]],
                              [1, Highcharts.Color(Highcharts.getOptions().colors[3]).setOpacity(0).get('rgba')]
                          ]
                      },
                      marker: {
                          radius: 2
                      },
                      lineWidth: 0,
                      states: {
                          hover: {
                              lineWidth: 0.2
                          }
                      },
                      threshold: null
                  }
              },

              series: [{
                  type: 'area',
                  name: '',
  								// data: [[1,55],[2,56],[3,67],[4,89]]
                  data: this.sensorTimeSeries.map( entry => [entry.dataCollectedDate.toString(), entry.availability])
              }]
          });

              Highcharts.chart('downtime', {
                  chart: {
                      zoomType: 'x'
                  },
                  title: {
                      text: 'Product 4'
                  },
                  yAxis: {
                      title: {
                          text: 'Emmissions'
                      }
                  },
                  xAxis: {
                      title: {
                          text: 'Time'
                      }
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
                                  [0, Highcharts.getOptions().colors[1]],
                                  [1, Highcharts.Color(Highcharts.getOptions().colors[3]).setOpacity(0).get('rgba')]
                              ]
                          },
                          marker: {
                              radius: 2
                          },
                          lineWidth: 0,
                          states: {
                              hover: {
                                  lineWidth: 0.2
                              }
                          },
                          threshold: null
                      }
                  },

                  series: [{
                      type: 'area',
                      name: '',
      								// data: [[1,55],[2,56],[3,67],[4,89]]
                      data: this.sensorTimeSeries.map( entry => [entry.dataCollectedDate.toString(), entry.availability])
                  }]
              });
  			},
        buildCapacity(){
            Highcharts.chart('sensorReliability2', {
                chart: {
                    zoomType: 'x'
                },
                title: {
                    text: 'Reliability'
                },
                yAxis: {
                    title: {
                        text: 'Sensor Reliability'
                    }
                },
                xAxis: {
                    title: {
                        text: 'Time'
                    }
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
                                [0, Highcharts.getOptions().colors[4]],
                                [1, Highcharts.Color(Highcharts.getOptions().colors[1]).setOpacity(0).get('rgba')]
                            ]
                        },
                        marker: {
                            radius: 2
                        },
                        lineWidth: 0,
                        states: {
                            hover: {
                                lineWidth: 0.2
                            }
                        },
                        threshold: null
                    }
                },

                series: [{
                    type: 'area',
                    name: '',
    								// data: [[1,55],[2,56],[3,67],[4,89]]
                    data: this.sensorTimeSeries.map( entry => [entry.dataCollectedDate.toString(), entry.availability])
                }]
            });
    			},
          buildDowntime(){
              Highcharts.chart('sensorAvailabilityChart2', {
                  chart: {
                      zoomType: 'x'
                  },
                  title: {
                      text: 'Availability for sensor 2'
                  },
                  yAxis: {
                      title: {
                          text: 'Availability'
                      }
                  },
                  xAxis: {
                      title: {
                          text: 'Time'
                      }
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
                                  [0, Highcharts.getOptions().colors[3]],
                                  [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                              ]
                          },
                          marker: {
                              radius: 2
                          },
                          lineWidth: 1,
                          states: {
                              hover: {
                                  lineWidth: 1.3
                              }
                          },
                          threshold: null
                      }
                  },

                  series: [{
                      type: 'area',
                      name: 'Availability %',
      								// data: [[1,55],[2,56],[3,67],[4,89]]
                      data: this.sensorTimeSeries.map( entry => [entry.dataCollectedDate.toString(), entry.availability])
                  }]
              });
      			}
  },
  created () {
    this.fetchEmmissionsData();
    this.formatSensorTime();
			this.fetchSensorTimeSeries();
  }
})
