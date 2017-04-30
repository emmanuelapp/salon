class WeekBoardRow extends React.Component {
  render () {
    let days = this.props.bookings.map((booking) =>
      <WeekBoardReservation booking={booking} key={booking.id}/>
    );

    let reservationsCount = <span className="badge">{days.length}</span>;
    let dayLabel = <span className='label label-danger'>{this.props.day}</span>;

    return(
      <tr>
        <td>{reservationsCount} {dayLabel}</td>

        {days}
      </tr>
    );
  }
}
