var clientApp = new Vue({
  el: '#clientTable',
  data: {
    clients:[
      {
      clientId : '',
      clientName: '',
      clientDescription : '',
      gicsSector : '',
      gicsSubIndustry : '',
      headquarters : ''
    }
  ],
  clientNotes:[
    {
      clientName: '',
      meetingDate: '',
      notes: ''
    }
  ],
  notesForm: {},
  },
  computed: {
  },
  methods: {
    handleNotesForm(e){
      const s = JSON.stringify(this.notesForm);

      console.log(s);

      // POST to remote server
      fetch('api/note.php', {
        method: "POST", // *GET, POST, PUT, DELETE, etc.
        headers: {
            "Content-Type": "application/json; charset=utf-8"
        },
        body: s // body data type must match "Content-Type" header
      })
      .then( response => response.json() )
      .then( json => {this.clientNotes.push(json)})
      .catch( err => {
        console.error('WORK POST ERROR:');
        console.error(err);
      })

        this.notesForm = this.getEmptyNotesForm();
    },
    getEmptyNotesForm() {
      return {
        clientName: null,
        meetingDate: null,
        notes: null
      }
    },
    fetchClient () {
      fetch('api/client.php')
      .then( response => response.json() )
      .then( json => {clientApp.clients = json} )
      .catch( err => {
        console.log('CLIENT FETCH ERROR:');
        console.log(err);
      })
    },
    fetchNotes(){
      fetch('api/note.php')
      .then(response => response.json() )
      .then (json => {clientApp.clientNotes = json})
      .catch(err => {
        console.log('NOTES FETCH ERROR: ');
        console.log(err);
      })
    }
  },
  created () {
    this.notesForm = this.getEmptyNotesForm();
    this.fetchClient();
    this.fetchNotes();
  }
})
