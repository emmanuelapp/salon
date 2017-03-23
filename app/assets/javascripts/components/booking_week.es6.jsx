class BookingWeek extends React.Component {
  render () {
    return(
      <div>
        <h4>This Week</h4>
        {this.props.this_week.map((booking) => <BookingCard user={booking}/>)}
      </div>
    );
  }
}
