class WeekBoard extends React.Component {
  render () {
    let columns = this.props.dailyBookings.map((day) =>
      <WeekBoardDayColumn day={day[0]} bookings={day[1]} />
    );

    return(
      <table className='table'>
        <tbody>
          {columns}
        </tbody>
      </table>
    );
  }
}
