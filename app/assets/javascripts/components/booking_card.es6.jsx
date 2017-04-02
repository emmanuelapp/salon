class BookingCard extends React.Component {
  constructor(props) {
    super(props);

    this.statusBadge = this.statusBadge.bind(this);
    this.displayAdditionalInfo = this.displayAdditionalInfo.bind(this);
    this.editPath = this.editPath.bind(this);
    this.formatReservationDate = this.formatReservationDate.bind(this);
  }

  statusBadge() {
    if(this.props.user.confirmed) {
      state = 'CONFIRMED';
      klazz = 'btn btn-success btn-xs';
    } else {
      state = 'PENDING';
      klazz = 'btn btn-danger btn-xs';
    }

    return(<a className={klazz}>{state}</a>);
  }

  displayAdditionalInfo() {
    if(this.props.user.additional_info === null) {
      return(<i>Empty</i>);
    } else {
      return(this.props.user.additional_info);
    }
  }

  editPath() {
    let id = this.props.user.id.toString();
    let path = '/dashboard/bookings/' + id + '/edit';

    return(<a href={path}>Edit</a>);
  }

  formatReservationDate() {
    let reservedAt = new Date(this.props.user.reserved_at);

    return(reservedAt.toLocaleString());
  }

  render () {
    return(
      <tr>
        <td>{this.editPath()}</td>
        <td>{this.props.user.first_name} {this.props.user.last_name}</td>
        <td>{this.statusBadge()}</td>
        <td>{this.props.user.phone}</td>
        <td>{this.formatReservationDate()}</td>
        <td>{this.displayAdditionalInfo()}</td>
      </tr>
    );
  }
}
