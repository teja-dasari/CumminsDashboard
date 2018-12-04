var siteApp = new Vue({
  el: '#site',
  data: {
    sites:[
      {
      siteId : '',
      clientId: '',
      siteName: '',
      siteDescription : '',
      primaryContact : '',
      capacity : '',
      commercialDate : '',
      addrLine1: '',
      addrLine2: '',
      addrCity: '',
      addrState: '',
      addrZip: '',
      addrCountry: '',
      imgPath:''
    }
  ]
  },
  computed: {
  },
  methods: {
    fetchSite () {
      fetch('api/site.php')
      .then( response => response.json() )
      .then( json => {siteApp.sites = json} )
      .catch( err => {
        console.log('TASK FETCH ERROR');
        console.log(err);
      })
    }
  },
  created () {
    this.fetchSite();
  }
})
