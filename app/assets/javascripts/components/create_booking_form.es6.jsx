class CreateBookingForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      first_name: '',
      last_name: '',
      reserved_at: '',
      phone: '',
      additional_info: '',
      offer_ids: [],
      errors: ''
    }

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleFirstNameChange = this.handleFirstNameChange.bind(this);
    this.handleLastNameChange = this.handleLastNameChange.bind(this);
    this.handlePhoneChange = this.handlePhoneChange.bind(this);
    this.handleInfoChange = this.handleInfoChange.bind(this);
  }

  handleSubmit(event) {
    $.ajax({
      url: '/api/v1/bookings',
      dataType: 'json',
      type: 'POST',
      data: {
        booking: {
          first_name: this.state.first_name,
          last_name: this.state.last_name,
          reserved_at: this.state.reserved_at,
          additional_info: this.state.additional_info,
          offer_ids: this.state.offer_ids,
          phone: this.state.phone
        }
      },
      success: function(data) {
        alert('Success!!!!');
      },
      error: ((xhr, status, err) => (
        this.setState({errors: xhr['responseJSON']['error']})
      )).bind(this)
     });

    event.preventDefault();
  }

  handleFirstNameChange(event) {
    this.setState({first_name: event.target.value});
  }

  handleLastNameChange(event) {
    this.setState({last_name: event.target.value});
  }

  handlePhoneChange(event) {
    this.setState({phone: event.target.value});
  }

  handleInfoChange(event) {
    this.setState({additional_info: event.target.value});
  }

  render () {
    let errors = <div className="alert alert-danger"><strong>Error!</strong> {this.state.errors}</div>;

    return(
      <div className='container'>
        <div className='row'>
          {this.state.errors !== '' && errors}


          <form onSubmit={this.handleSubmit}>
            <div className='col-lg-6'>
              <div className='form-group'>
                <label>Full Name</label>
                
                <div className="input-group">
                  <span className="input-group-addon">
                    <span className="glyphicon glyphicon-user" aria-hidden="true"></span>
                  </span>

                  <input type='text' className='form-control' placeholder='First name' onChange={this.handleFirstNameChange}/>
                  <input type='text' className='form-control' placeholder='Last name' onChange={this.handleLastNameChange}/>
                </div>

                <label>Phone Number</label>

                <div className="input-group">
                  <span className="input-group-addon">
                    <span className="glyphicon glyphicon-phone" aria-hidden="true"></span>
                  </span>

                  <input type='text' className='form-control' placeholder='Phone' onChange={this.handlePhoneChange} />
                </div>
              </div>
            </div>

            <div className='col-lg-6'>
              <div className='form-group'>
                <OffersDropdown />
                <BookingFormCalendar />
              </div>
            </div>

            <div className='row'>
              <div className='col-lg-12'>
                <div className='form-group'>
                  <label>Additional Information</label>

                  <div className='input-group'>
                    <span className="input-group-addon">
                      <span className="glyphicon glyphicon-comment" aria-hidden="true"></span>
                    </span>

                    <textarea className='form-control' placeholder='Additional Information' onChange={this.handleInfoChange}/>
                  </div>
                </div>

                <input type='submit' value='submit' className='btn btn-warning btn-block' />
              </div>
            </div>
          </form>
        </div>
      </div>
    );
  }
}
