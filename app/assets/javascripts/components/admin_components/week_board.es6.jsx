class WeekBoard extends React.Component {
  render () {
    let columns = this.props.dailyBookings.map((day) =>
      <WeekBoardRow day={day[0]} bookings={day[1]} key={day[0]} />
    );

    return(
      <table className='table'>
        <thead>
          <tr>
            <th>Reservations / Day</th>
            <th>Reservations</th>
          </tr>
        </thead>

        <tbody>
          {columns}
        </tbody>
      </table>
    );
  }
}
