class BookingCard extends React.Component {
  constructor(props) {
    super(props);

    this.statusBadge = this.statusBadge.bind(this);
    this.displayAdditionalInfo = this.displayAdditionalInfo.bind(this);
  }

  statusBadge() {
    if(this.props.user.approved) {
      state = 'APPROVED';
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

  render () {
    return(
      <tr>
        <td>{this.props.user.first_name} {this.props.user.last_name}</td>
        <td>{this.statusBadge()}</td>
        <td>{this.props.user.phone}</td>
        <td>{this.props.user.reserved_at}</td>
        <td>{this.displayAdditionalInfo()}</td>
      </tr>
    );
  }
}
