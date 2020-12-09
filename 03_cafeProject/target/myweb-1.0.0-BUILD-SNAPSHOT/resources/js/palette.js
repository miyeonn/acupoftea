const colors = {
  RED: "#F44336",
  PINK: "#E91E63",
  PURPLE: "#9C27B0",
  "DEEP PURPLE": "#673AB7",
  INDIGO: "#3F51B5",
  BLUE: "#2196F3",
  "LIGHT BLUE": "#03A9F4",
  CYAN: "#00BCD4",
  TEAL: "#009688",
  GREEN: "#4CAF50",
  "LIGHT GREEN": "#8BC34A",
  LIME: "#CDDC39",
  YELLOW: "#FFEB3B",
  AMBER: "#FFC107",
  ORANGE: "#FF9800",
  "DEEP ORANGE": "#FF5722",
  BROWN: "#795548",
  GREY: "#9E9E9E",
  "BLUE GREY": "#607D8B"
};

const Palette = () => {
  const [pickColor, setPickColor] = React.useState(colors["TEAL"]);
  const handlePickColor = k => setPickColor(colors[k]);
  return (
    <div className="wrapper" style={{background: pickColor}}>
      <div className="palette">
        {colors &&
          Object.keys(colors).map(k => (
          <button
            className="btn"
            style={{ background: colors[k] }}
            onClick={() => {
              handlePickColor(k);
            }}
            />
        ))}
      </div>
    </div>)
}


ReactDOM.render(
  <Palette />,
  document.querySelector('#palette-app')
);
