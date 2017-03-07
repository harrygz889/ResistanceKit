class SearchResultsPost extends React.Component {
  render () {
    return (
      <li>{this.props.meeting.name} -- {this.props.meeting.location}</li>
    );
  }
}
