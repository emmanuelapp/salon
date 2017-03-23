class BookingCard extends React.Component {
  render () {
    let first_name = this.props.user.first_name;
    let last_name = this.props.user.last_name;
    let phone = this.props.user.phone;
    let reserved_at = this.props.user.reserved_at;
    let approved = this.props.user.approved;
    let additionalInfo = this.props.user.additional_info;

    let statusBadge;

    if(approved) {
      statusBadge = <a className='btn btn-success btn-xs'>APPROVED</a>
    } else {
      statusBadge = <a className='btn btn-danger btn-xs'>PENDING</a>
    }

    return(
      <div className='container'>
        <div className='row'>
          <div className='col-lg-4'>

            <p><b>Full name:</b> {first_name} {last_name}</p>
            <p><b>Phone:</b> {phone}</p>
            <p>{statusBadge}</p>
          </div>

          <div className='col-lg-8'>
            <p><b>Reserved for:</b> {reserved_at}</p>
            <h5>Additional Info:</h5>
            <div className='well well-sm'>
              {additionalInfo === null ? <i>Empty</i> : additionalInfo}
            </div>
          </div>

        </div>
      </div>
    );
  }
}
