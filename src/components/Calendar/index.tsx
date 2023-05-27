import * as React from "react";
import ReactCalendar from "react-calendar";

// eslint-disable-next-line @typescript-eslint/no-empty-interface
export interface IAppProps {}

export default function index(props: IAppProps) {
  return (
    <div>
      <ReactCalendar
        minDate={new Date()}
        className={"REACT-CALNEDAR p-2"}
        view="month"
        onClickDay={(date) => console.log(date)}
      />
    </div>
  );
}
 