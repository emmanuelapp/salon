class WeekBoardDayColumn extends React.Component {
  render () {
    return(
      <td>
        <tr>{this.props.day}</tr>
        {this.props.bookings.map((booking) => <WeekBoardDay booking={booking} />)}
      </td>
    );
  }
}
