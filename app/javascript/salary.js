// app/javascript/salary.js

function calculateSalaries(extraLeaves, salary) {
  // Validate input
  if (isNaN(extraLeaves) || isNaN(salary)) {
    throw new Error('Please enter valid numbers for Extra Leaves and Salary.');
  }

  let extraLeavesCompensation, deductions, adjustedSalary, totalAnnualSalary, salaryDisbursed, status;

  if (extraLeaves > 11) {
    extraLeavesCompensation = salary * 0.05 * extraLeaves;
    status = 'Inactive'; // Inactive status
  } else {
    extraLeavesCompensation = salary * 0.025 * extraLeaves;
    status = 'Active'; // Active status
  }

  deductions = extraLeavesCompensation;
  adjustedSalary = salary - deductions;
  totalAnnualSalary = salary * 12;
  salaryDisbursed = adjustedSalary * 7;

  // Show the calculation details
  const showMath = `Salary: ${salary} - Deductions: ${deductions} = Adjusted Salary: ${adjustedSalary}`;

  // Return the results
  return {
    deductions: deductions.toFixed(2),
    adjustedSalary: adjustedSalary.toFixed(2),
    totalAnnualSalary: totalAnnualSalary.toFixed(2),
    salaryDisbursed: salaryDisbursed.toFixed(2),
    status: status === 'Active' ? 1 : 0,
    calculationDetails: showMath
  };
}

module.exports = calculateSalaries;
