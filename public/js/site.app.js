var cumminsApp = new Vue({
  el: '#iotDiv',
  data: {
    iotdata: 
      [
        {
          productId: 0,
          productName: "",
          fuelConsumption: "",
          oilStatus: "",
          batteryStatus: "e",
          engineStatus: "",
          defectType: "",
          defectID: ''
        }
      ]

  },
  computed: {
  },
  methods: {
    fetchIotData () {
      fetch('http://ec2-35-166-59-91.us-west-2.compute.amazonaws.com/api/iotdata.php')
      .then( response => response.json() )
      .then( json => {cumminsApp.iotdata = json; console.log(json)} )
      .catch( err => {
        console.log('Data fetch error');
        console.log(err);
      })
    }
  },
  created () {
    this.fetchIotData();
  }
})
