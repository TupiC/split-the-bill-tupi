"use client";
import supabase from "@/utils/supabase";
import { Form, Formik } from "formik";

export default async function Page() {
  const { data: groups } = await supabase.from("groups").select();

  const { data: userInGroup } = await supabase
    .from("userInGroup")
    .select(
      `"*",
    users(username, userId)
  `
    )
    .eq("groupId", groups[0].groupId);
  console.log(userInGroup);

  function toggleUser(user) {
    const checkBox = document.getElementById("check_" + user);

    if (checkBox.checked) {
      document.getElementById("user_id_" + user).checked = false;
      toggleField(user);
    } else {
      document.getElementById("user_id_" + user).checked = true;
      document
        .getElementById("portion_" + user)
        .setAttribute("disabled", "disabled");
    }
  }
  function toggleField(user) {
    const checkBox = document.getElementById("user_id_" + user);
    const textField = document.getElementById("portion_" + user);

    if (checkBox.checked) {
      textField.removeAttribute("disabled");
    } else {
      textField.setAttribute("disabled", "disabled");
    }
  }

  async function addExpense(
    groupId,
    total,
    payedBy,
    comment,
    createdAt,
    title
  ) {
    try {
      const { error } = await supabase.from("transactions").insert({
        groupId: groupId,
        total: total,
        payedBy: payedBy,
        comment: comment,
        createdAt,
        title: title,
      });
      if (error) throw error;
    } catch (error) {
      console.log("Error adding transaction!", error);
    }
  }

  return (
    <main>
      <h2>{groups[0].groupname}</h2>
      <div className="overlay">
        <Formik>
          <Form></Form>
        </Formik>
        <form>
          <ul className="two-row-list flex-list-parent">
            <li>
              <label htmlFor="title">Title </label>
              <span className="flex-right">
                <input type="text" name="title" id="title" />
              </span>
            </li>
            <li>
              {" "}
              Who paid?{" "}
              <span className="flex-right">
                <select name="payer">
                  <option selected="selected" hidden="">
                    - Select User -
                  </option>
                  {userInGroup?.map((user) => (
                    <option value={user.users.userId}>
                      {user.users.username}
                    </option>
                  ))}
                </select>
              </span>
            </li>
            <li>
              <label htmlFor="total">Total </label>
              <span className="flex-right">
                <input
                  type="number"
                  step=".01"
                  name="total"
                  className="number-field"
                />
                €
              </span>
            </li>

            {userInGroup?.map((user) => (
              <li>
                <span>
                  <input
                    type="checkbox"
                    name={`check_${user.users.userId}`}
                    id={`check_${user.users.userId}`}
                    checked="checked"
                    onClick={() => toggleUser(user.users.userId)}
                  />
                  <label htmlFor={`check_${user.users.userId}`}>
                    {user.users.username}{" "}
                  </label>
                </span>
                <span></span>
                <span>
                  <input
                    type="number"
                    step=".01"
                    name={`portion_${user.users.userId}`}
                    id={`portion_${user.users.userId}`}
                    value="0"
                    className="number-field"
                  />
                  €
                </span>
                <span className="flex-right">
                  {" "}
                  or
                  <input
                    type="checkbox"
                    name={`user_id_${user.users.userId}`}
                    id={`user_id_${user.users.userId}`}
                    onClick={() => toggleField(user.users.userId)}
                  />
                  <label htmlFor={`user_id_${user.users.userId}`}>
                    {" "}
                    split the rest
                  </label>
                </span>
              </li>
            ))}
            <li>
              <label htmlFor="comment">Comment: </label>
              <textarea name="comment" />
            </li>
          </ul>
          <input type="hidden" name="groupId" value={groups[0].groupId} />
          <p className="center-ui">
            <button
              type="button"
              name="create"
              className="button"
              // onClick={() => addExpense(groups[0].groupId,)}
              onClick={() => console.log("in progress")}
            >
              Add
            </button>
          </p>
        </form>
      </div>
    </main>
  );
}
