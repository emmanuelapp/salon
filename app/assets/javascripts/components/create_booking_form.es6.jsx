class CreateBookingForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      first_name: '',
      last_name: '',
      reserved_at: '',
      phone: '',
      additional_info: '',
      offer_id: '',
      errors: '',
      success: ''
    }

    this.handleSubmit = this.handleSubmit.bind(this);
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
          offer_id: this.state.offer_id,
          phone: this.state.phone
        }
      },
      success: ((data) => this.setState({success: 'Your reservation has been made!'})).bind(this),
      error: ((xhr, status, err) => (this.setState({errors: xhr['responseJSON']['error']}))).bind(this)
     });

    event.preventDefault();
  }

  render () {
    let errors = <div className="alert alert-danger"><strong>Error!</strong> {this.state.errors}</div>;
    let success = <div className="alert alert-success"><strong>Success!</strong>{this.state.success}</div>

    return(
      <div className='container'>
        <div className='row'>
          {this.state.errors !== '' && errors}
          {this.state.success !== '' && success}

          <form onSubmit={this.handleSubmit}>
            <div className='col-lg-6'>
              <UserDetails onFirstNameChange={(event) => this.setState({first_name: event.target.value})} 
                           onLastNameChange={(event) => this.setState({last_name: event.target.value})}
                           onPhoneChange={(event) => this.setState({phone: event.target.value})} />
            </div>

            <div className='col-lg-6'>
              <div className='form-group'>
                <OffersDropdown onChange={(event) => this.setState({offer_id: event.target.value})}
                                onReservedAtChange={(event) => this.setState({reserved_at: event.target.value})} />
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

                    <textarea className='form-control'
                              placeholder='Additional Information'
                              onChange={(event) => this.setState({additional_info: event.target.value})}/>
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
