class BookingsBoard extends React.Component {
  constructor(props) {
    super(props);

    this.bookingCards = this.bookingCards.bind(this);
  }

  bookingCards(cards) {
    return(cards.map((booking) => (<BookingCard user={booking}/>)));
  }

  render() {
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

        <tbody>
          <tr>
            <th colSpan={5}>Pending</th>
          </tr>
          {this.bookingCards(this.props.notApproved)}

          <tr>
            <th colSpan={5}>Approved</th>
          </tr>
          {this.bookingCards(this.props.approved)}
        </tbody>
      </table>
    );
  }
}
