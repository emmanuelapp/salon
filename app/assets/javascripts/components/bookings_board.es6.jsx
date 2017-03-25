class BookingsBoard extends React.Component {
  render () {
    let approved = this.props.approved;
    let notApproved = this.props.not_approved;

    return(
      <table className='table'>
        <thead>
          <tr>
            <th>Full name</th>
            <th>State</th>
            <th>Phone</th>
            <th>Reservation Date</th>
            <th>Additional Info</th>
          </tr>
        </thead>

        <tr>
          <th colSpan={5}>Pending</th>
        </tr>
        {notApproved.map((booking) => (<BookingCard user={booking}/>))}

        <tr>
          <th colSpan={5}>Approved</th>
        </tr>
        {approved.map((booking) => (<BookingCard user={booking}/>))}
      </table>
    );
  }
}
