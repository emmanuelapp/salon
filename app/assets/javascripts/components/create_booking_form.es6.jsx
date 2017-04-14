class CreateBookingForm extends React.Component {
  render () {
    return(
      <div className='container'>
        <div className='row'>

          <form>
            <div className='col-lg-6'>
              <div className='form-group'>
                <label>Full Name</label>
                
                <div className="input-group">
                  <span className="input-group-addon">
                    <span className="glyphicon glyphicon-user" aria-hidden="true"></span>
                  </span>

                  <input type='text' className='form-control' placeholder='First name' />
                  <input type='text' className='form-control' placeholder='Last name' />
                </div>

                <label>Phone Number</label>

                <div className="input-group">
                  <span className="input-group-addon">
                    <span className="glyphicon glyphicon-phone" aria-hidden="true"></span>
                  </span>

                  <input type='text' className='form-control' placeholder='Phone' />
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

                    <textarea className='form-control' placeholder='Additional Information' />
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
