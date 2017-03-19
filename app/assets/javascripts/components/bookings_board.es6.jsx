class BookingsBoard extends React.Component {
  render () {
    let approved = this.props.approved;
    let notApproved = this.props.not_approved;

    let cards = approved.map((booking) => (<BookingCard user={booking}/>));
    let notApprovedCards = notApproved.map((booking) => (<BookingCard user={booking}/>));

    return(
      <div>
        <h1>All Bookings</h1>
        <h4>Pending</h4>
        {notApprovedCards}
        <h4>Approved</h4>
        {cards}
      </div>
    );
  }
}
