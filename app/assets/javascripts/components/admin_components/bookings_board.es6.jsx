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
            <th>Edit</th>
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
          {this.bookingCards(this.props.pending)}

          <tr>
            <th colSpan={5}>Confirmed</th>
          </tr>
          {this.bookingCards(this.props.confirmed)}
        </tbody>
      </table>
    );
  }
}
