class UserDetails extends React.Component {
  render () {
    return(
      <div>
        <div className='form-group'>
          <label>Full Name</label>
          
          <div className="input-group">
            <span className="input-group-addon">
              <span className="glyphicon glyphicon-user" aria-hidden="true"></span>
            </span>

            <input type='text'
                   className='form-control'
                   placeholder='First name'
                   onChange={this.props.onFirstNameChange}
                   required={true} />

            <input type='text'
                   className='form-control'
                   placeholder='Last name'
                   onChange={this.props.onLastNameChange}
                   required={true} />
          </div>
        </div>

        <div className='form-group'>
          <label>Phone Number</label>

          <div className="input-group">
            <span className="input-group-addon">
              <span className="glyphicon glyphicon-phone" aria-hidden="true"></span>
            </span>

            <input type='text'
                   className='form-control'
                   placeholder='Phone'
                   onChange={this.props.onPhoneChange}
                   required={true} />
          </div>
        </div>
      </div>
    );
  }
}
