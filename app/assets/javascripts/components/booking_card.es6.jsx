class BookingCard extends React.Component {
  render () {
    let first_name = this.props.user.first_name;
    let last_name = this.props.user.last_name;
    let phone = this.props.user.phone;
    let reserved_at = this.props.user.reserved_at;
    let approved = this.props.user.approved;
    let additionalInfo = this.props.user.additional_info;

    let statusBadge;

    if(approved) {
      statusBadge = <a className='btn btn-success btn-xs'>APPROVED</a>
    } else {
      statusBadge = <a className='btn btn-danger btn-xs'>PENDING</a>
    }

    return(
      <tr>
        <td>{first_name} {last_name}</td>
        <td>{statusBadge}</td>
        <td>{phone}</td>
        <td>{reserved_at}</td>
        <td>{additionalInfo === null ? <i>Empty</i> : additionalInfo}</td>
      </tr>
    );
  }
}
