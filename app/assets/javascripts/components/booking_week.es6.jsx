class BookingWeek extends React.Component {
  constructor(props) {
    super(props);

    this.cards = this.cards.bind(this);
  }

  cards() {
    return(this.props.thisWeek.map((booking) =>
      <BookingCard user={booking}/>
    ));
  }

  render () {
    return(
      <table className='table'>
        {this.cards()}
      </table>
    );
  }
}
