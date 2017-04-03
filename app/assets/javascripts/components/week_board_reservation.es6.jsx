class WeekBoardReservation extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      showAdditionalInfo: false
    };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    alert('TODO: show additional_info data');
  }

  render () {
    let firstName = this.props.booking.first_name;
    let lastName = this.props.booking.last_name;
    let reservedAt = new Date(this.props.booking.reserved_at).toLocaleString();

    return(
      <td className='well'>
        <p><b>{firstName} {lastName}</b></p>
        <p><span className="label label-warning">{reservedAt}</span></p>
        <p>ID: {this.props.booking.id}</p>
        
        <a onClick={this.handleClick} className='btn btn-info btn-xs btn-block'>info</a>
      </td>
    );
  }
}
