class WeekBoardReservation extends React.Component {
  render () {
    let firstName = this.props.booking.first_name;
    let lastName = this.props.booking.last_name;
    let reservedAt = new Date(this.props.booking.reserved_at).toLocaleString();

    return(
      <td className='well'>
        <p><b>{firstName}</b></p>
        <p><b>{lastName}</b></p>
        <p>ID: {this.props.booking.id}</p>

        <p><span className="label label-warning">{reservedAt}</span></p>
        
        <a href={'/dashboard/bookings/' + this.props.booking.id} className='btn btn-info btn-xs btn-block'>info</a>
      </td>
    );
  }
}
